package com.kaciula.archiman.presentation.util

import com.jakewharton.rxrelay2.BehaviorRelay
import io.reactivex.Observable
import io.reactivex.Scheduler
import io.reactivex.Single
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.Disposable
import io.reactivex.schedulers.Schedulers
import timber.log.Timber
import java.util.*

sealed class AbstractState
open class ElmState : AbstractState()

sealed class AbstractMsg
open class Msg : AbstractMsg()
open class HighPriorityMsg : Msg()
object Idle : Msg()
class ErrorMsg(val err: Throwable, val cmd: Cmd) : Msg()


sealed class AbstractCmd
open class Cmd : AbstractCmd()
object None : Cmd()
data class OneShotCmd(val msg: HighPriorityMsg) : Cmd()
data class BatchCmd(val cmds: List<Cmd>) : Cmd()

abstract class ElmSubscription<T : Msg, in PARAMS>(protected val uiScheduler: Scheduler) {
    private var observable: Observable<T>? = null
    private var params: PARAMS? = null

    protected abstract fun buildObservable(params: PARAMS): Observable<T>

    fun getObservable(params: PARAMS): Pair<Observable<T>, Boolean> {
        var recreated = false
        if (observable == null || this.params != null && this.params != params) {
            this.params = params
            recreated = true
            observable = buildObservable(params).observeOn(uiScheduler)
        }
        return Pair(observable!!, recreated)
    }
}

interface ElmPresenter<S : ElmState> {

    fun update(msg: Msg, state: S): Pair<S, Cmd>

    fun render(state: S)

    fun call(cmd: Cmd): Single<Msg>

    fun sub(state: S)
}


class Elm<S : ElmState> {

    private val uiScheduler: Scheduler = AndroidSchedulers.mainThread()
    private val msgRelay: BehaviorRelay<Msg> = BehaviorRelay.create()
    private var msgQueue = ArrayDeque<Msg>()
    private var highPriorityMsgQueue = ArrayDeque<HighPriorityMsg>()
    private var disposableMap: MutableMap<String, Disposable> = mutableMapOf()
    private lateinit var state: S
    private lateinit var elmPresenter: ElmPresenter<S>
    private var lock: Boolean = false

    fun init(initialState: S, elmPresenter: ElmPresenter<S>): Disposable {
        this.elmPresenter = elmPresenter
        this.state = initialState
        elmPresenter.sub(initialState)
        return msgRelay
                .observeOn(uiScheduler)
                .map { msg ->
                    Timber.d("elm update msg:$msg ")
                    val oldState = state
                    val updateResult = elmPresenter.update(msg, oldState)
                    state = updateResult.first

                    if (msg is HighPriorityMsg && highPriorityMsgQueue.size > 0) {
                        highPriorityMsgQueue.removeFirst()
                    } else if (msgQueue.size > 0) {
                        msgQueue.removeFirst()
                    }

                    lock = false
                    if (state != oldState) {
                        elmPresenter.render(state)
                    }
                    elmPresenter.sub(state)
                    loop()
                    return@map updateResult
                }
                .filter { (_, cmd) -> cmd !is None }
                .observeOn(Schedulers.io())
                .flatMap { (state, cmd) ->
                    Timber.d("elm call cmd:$cmd state:$state ")
                    call(cmd)
                }
                .observeOn(uiScheduler)
                .subscribe({ msg ->
                    Timber.d("elm subscribe msg:${msg.javaClass.simpleName}")
                    when (msg) {
                        is Idle -> {
                        }
                        is HighPriorityMsg -> highPriorityMsgQueue.addLast(msg)
                        else -> msgQueue.addLast(msg)
                    }

                    loop()
                })
    }

    private fun call(cmd: Cmd): Observable<Msg> {
        return when (cmd) {
            is BatchCmd ->
                Observable.merge(cmd.cmds.map {
                    cmdCall(it)
                })
            else -> cmdCall(cmd)
        }
    }

    private fun cmdCall(cmd: Cmd): Observable<Msg> {
        return when (cmd) {
            is OneShotCmd -> Observable.just(cmd.msg)
            else -> elmPresenter.call(cmd)
                    .onErrorResumeNext { err -> Single.just(ErrorMsg(err, cmd)) }
                    .toObservable()
        }
    }

    fun render() {
        elmPresenter.render(state)
    }

    private fun loop() {
        if (!lock) {
            if (highPriorityMsgQueue.size > 0) {
                lock = true
                msgRelay.accept(highPriorityMsgQueue.first)
            } else if (msgQueue.size > 0) {
                lock = true
                msgRelay.accept(msgQueue.first)
            }
        }
    }

    fun accept(msg: Msg) {
        Timber.d("elm accept event:${msg.javaClass.simpleName}")
        if (msg is HighPriorityMsg) {
            highPriorityMsgQueue.addLast(msg)
        } else {
            msgQueue.addLast(msg)
        }
        if (!lock) {
            if (msgQueue.size == 1 && highPriorityMsgQueue.isEmpty()) {
                lock = true
                msgRelay.accept(msgQueue.first)
            } else if (msgQueue.isEmpty() && highPriorityMsgQueue.size == 1) {
                lock = true
                msgRelay.accept(highPriorityMsgQueue.first)
            }
        }
    }

    fun <T : Msg, P> addSub(useCaseStream: ElmSubscription<T, P>, params: P) {
        val (sub, created) = useCaseStream.getObservable(params)
        if (created) {
            val disposable = disposableMap[useCaseStream.javaClass.canonicalName]
            disposable?.dispose()
            disposableMap.put(useCaseStream.javaClass.canonicalName,
                    sub.subscribe { msg -> accept(msg) })
        }
    }

    fun <T : Msg, P> removeSub(useCaseStream: ElmSubscription<T, P>) {
        val disposable = disposableMap[useCaseStream.javaClass.canonicalName]
        if (disposable?.isDisposed != true) {
            disposable?.dispose()
        }
    }
}