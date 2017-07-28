package com.kaciula.archiman.presentation.screen.home

import com.jakewharton.rxrelay2.PublishRelay
import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.domain.util.GenericResult
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.presentation.screen.home.event.*
import io.reactivex.Observable
import io.reactivex.ObservableSource
import io.reactivex.ObservableTransformer
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.exceptions.OnErrorNotImplementedException
import io.reactivex.observers.DisposableObserver
import timber.log.Timber
import java.util.*

class HomePresenter(private val view: HomeContract.View,
                    private val schedulerProvider: SchedulerProvider,
                    private val getUsers: GetUsers) : HomeContract.Presenter {

    private val disposables: CompositeDisposable = CompositeDisposable()
    private var isFirstInit: Boolean = true
    private val flowRelay: PublishRelay<HomeViewEvent> = PublishRelay.create<HomeViewEvent>()

    override fun init() {
        Timber.d("presenter init")
        if (isFirstInit) {
            isFirstInit = false
            val initialViewModel = HomeViewModel(initialize = true)
            setupFlow(initialViewModel)

            flowRelay.accept(GetUsersEvent())
        } else {
            flowRelay.accept(RecreateEvent())
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
        flowRelay.accept(GetUsersEvent())
    }

    override fun onClickUser(user: UserViewModel) {
        flowRelay.accept(ClickUserEvent(user))
    }

    override fun onClickOkUserDialog(user: UserViewModel) {
        flowRelay.accept(ClickOkUserDialogEvent())
    }

    override fun onCancelUserDialog() {
        flowRelay.accept(CancelUserDialogEvent())
    }

    override fun onClickUserDetails(user: UserViewModel) {
        view.goToUserDetailsScreen(user)
    }

    private fun setupFlow(initialViewModel: HomeViewModel) {
        disposables.add(flowRelay
                .compose(EventsMerger(getUsers))
                .compose(StateReducer(initialViewModel))
                .observeOn(schedulerProvider.ui())
                .subscribeWith(FlowSubscriber()))
    }


    private class EventsMerger(private val getUsers: GetUsers) : ObservableTransformer<HomeViewEvent, GenericResult> {

        override fun apply(upstream: Observable<HomeViewEvent>): ObservableSource<GenericResult> {
            return upstream.publish { shared ->
                Observable.merge(
                        shared.ofType(GetUsersEvent::class.java)
                                .flatMap<GetUsers.ResponseModel> { getUsers.execute(GetUsers.RequestModel()) },
                        Observable.merge(
                                shared.ofType(ClickUserEvent::class.java)
                                        .flatMap { clickUserEvent ->
                                            Observable
                                                    .just(ClickUserResult(clickUserEvent.user))
                                        },
                                shared.ofType(ClickOkUserDialogEvent::class.java)
                                        .flatMap { Observable.just(ClickOkUserDialogResult()) },
                                shared.ofType(CancelUserDialogEvent::class.java)
                                        .flatMap { Observable.just(CancelUserDialogResult()) },
                                shared.ofType(RecreateEvent::class.java)
                                        .flatMap { Observable.just(RecreateResult()) }))
            }
        }
    }


    private class StateReducer(private val initialViewModel: HomeViewModel) : ObservableTransformer<GenericResult, HomeViewModel> {

        override fun apply(upstream: Observable<GenericResult>): ObservableSource<HomeViewModel> {
            return upstream.scan(initialViewModel) { viewModel, result ->
                if (result is GetUsers.ResponseModel) {
                    val (isInFlight, isError, _, _, users1) = result
                    if (isInFlight) {
                        return@scan HomeViewModel(isProgress = true)
                    } else if (isError) {
                        return@scan HomeViewModel(isError = true)
                    } else {
                        val users = ArrayList<UserViewModel>(users1!!.size)
                        for ((_, name) in users1) {
                            users.add(UserViewModel(name))
                        }
                        return@scan HomeViewModel(isContent = true, users = users)
                    }
                } else if (result is ClickUserResult) {
                    return@scan viewModel.copy(showUserDialog = true, dialogUser = result.user,
                            isRecreate = false, initialize = false)
                } else if (result is ClickOkUserDialogResult) {
                    return@scan viewModel.copy(showUserDialog = false, dialogUser = null,
                            isRecreate = false, initialize = false)
                } else if (result is CancelUserDialogResult) {
                    return@scan viewModel.copy(showUserDialog = false, dialogUser = null,
                            isRecreate = false, initialize = false)
                } else if (result is RecreateResult) {
                    return@scan viewModel.copy(isRecreate = true, initialize = true)
                }
                throw IllegalArgumentException(
                        "No view model representation for this kind of result")
            }
        }
    }


    private inner class FlowSubscriber : DisposableObserver<HomeViewModel>() {

        override fun onNext(viewModel: HomeViewModel) {
            view.render(viewModel)
        }

        override fun onError(throwable: Throwable) {
            throw OnErrorNotImplementedException(throwable)
        }

        override fun onComplete() {
            // Do nothing
        }
    }
}