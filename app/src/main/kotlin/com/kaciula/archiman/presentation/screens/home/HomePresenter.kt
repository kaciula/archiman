package com.kaciula.archiman.presentation.screens.home

import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.presentation.util.*
import io.reactivex.Single
import io.reactivex.disposables.CompositeDisposable
import timber.log.Timber

class HomePresenter(
        private val view: HomeContract.View,
        private val getUsers: GetUsers
) : HomeContract.Presenter {

    private val elm: Elm<HomeState> = Elm()
    private val disposables: CompositeDisposable = CompositeDisposable()
    private var isFirstInit: Boolean = true

    override fun init() {
        Timber.d("presenter init")
        if (isFirstInit) {
            isFirstInit = false
            val initialState = HomeState(initialize = true)
            disposables.add(elm.init(initialState, this))
            elm.accept(InitMsg)
            elm.accept(GetUsersMsg)
        } else {
            elm.accept(RecreateMsg)
        }
    }

    override fun start() {
        Timber.d("presenter start")
    }

    override fun stop() {
        Timber.d("presenter stop")
    }

    override fun destroy() {
        Timber.d("presenter destroy")
        disposables.clear()
    }

    override fun onClickRetry() {
        elm.accept(ClickRetryMsg)
    }

    override fun onClickUser(user: UserViewModel) {
        elm.accept(ClickUserMsg(user))
    }

    override fun onClickOkUserDialog(user: UserViewModel) {
        elm.accept(ClickOkUserDialogMsg)
    }

    override fun onCancelUserDialog() {
        elm.accept(CancelUserDialogMsg)
    }

    override fun onClickUserDetails(user: UserViewModel) {
        view.goToUserDetailsScreen(user)
    }

    override fun update(msg: Msg, state: HomeState): Pair<HomeState, Cmd> {
        return when (msg) {
            is InitMsg -> Pair(state, OneShotCmd(ResetInitMsg))
            is ResetInitMsg -> msg.reduceAndCmd(state)
            is GetUsersMsg -> msg.reduceAndCmd(state)
            is RecreateMsg -> Pair(msg.reduce(state), OneShotCmd(ResetInitMsg))

            is UsersDataMsg -> msg.reduceAndCmd()
            is ClickRetryMsg -> msg.reduceAndCmd(state)

            is ClickUserMsg -> Pair(msg.reduce(state), OneShotCmd(ResetClickUserMsg))
            is ResetClickUserMsg -> msg.reduceAndCmd(state)
            is ClickOkUserDialogMsg -> Pair(msg.reduce(state), None)
            is CancelUserDialogMsg -> Pair(msg.reduce(state), None)

            is ErrorMsg -> {
                Timber.d("Error ${msg.err.message} for ${msg.cmd}")
                Pair(state.copy(isError = true, error = msg.err), None)
            }
            else -> Pair(state, None)
        }
    }


    override fun call(cmd: Cmd): Single<Msg> {
        return when (cmd) {
            is GetUsersCmd -> getUsers.execute(GetUsers.RequestModel)
                    .map { responseModel -> UsersDataMsg(responseModel) }
            else -> Single.just(Idle)
        }
    }

    override fun sub(state: HomeState) {
    }

    override fun render(state: HomeState) {
        view.render(state)
    }
}
