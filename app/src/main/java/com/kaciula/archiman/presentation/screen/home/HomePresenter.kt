package com.kaciula.archiman.presentation.screen.home

import com.jakewharton.rxrelay2.PublishRelay
import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.domain.util.SchedulerProvider
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

            flowRelay.accept(HomeViewEvent.GetUsers())
        } else {
            flowRelay.accept(HomeViewEvent.Recreate())
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
        flowRelay.accept(HomeViewEvent.GetUsers())
    }

    override fun onClickUser(user: UserViewModel) {
        flowRelay.accept(HomeViewEvent.ClickUser(user))
    }

    override fun onClickOkUserDialog(user: UserViewModel) {
        flowRelay.accept(HomeViewEvent.ClickOkUserDialog())
    }

    override fun onCancelUserDialog() {
        flowRelay.accept(HomeViewEvent.CancelUserDialog())
    }

    override fun onClickUserDetails(user: UserViewModel) {
        view.goToUserDetailsScreen(user)
    }

    private fun setupFlow(initialViewModel: HomeViewModel) {
        disposables.add(flowRelay
                .doOnNext({ event -> Timber.i("Event: $event") })
                .compose(EventsMerger(getUsers))
                .compose(StateReducer(initialViewModel))
                .doOnNext({ viewModel -> Timber.i("ViewModel: $viewModel") })
                .observeOn(schedulerProvider.ui())
                .subscribeWith(FlowSubscriber()))
    }


    private class EventsMerger(private val getUsers: GetUsers) : ObservableTransformer<HomeViewEvent, HomeResult> {

        override fun apply(upstream: Observable<HomeViewEvent>): ObservableSource<HomeResult> {
            return upstream.publish { shared ->
                Observable.merge(
                        shared.ofType(HomeViewEvent.GetUsers::class.java)
                                .flatMap<GetUsers.ResponseModel> { getUsers.execute(GetUsers.RequestModel()) }
                                .map { responseModel -> HomeResult.GetUsers(responseModel) },
                        Observable.merge(
                                shared.ofType(HomeViewEvent.ClickUser::class.java)
                                        .flatMap { (user) ->
                                            Observable.just(HomeResult.ClickUser(user))
                                        },
                                shared.ofType(HomeViewEvent.ClickOkUserDialog::class.java)
                                        .flatMap { Observable.just(HomeResult.ClickOkUserDialog()) },
                                shared.ofType(HomeViewEvent.CancelUserDialog::class.java)
                                        .flatMap { Observable.just(HomeResult.CancelUserDialog()) },
                                shared.ofType(HomeViewEvent.Recreate::class.java)
                                        .flatMap { Observable.just(HomeResult.Recreate()) }))
            }
        }
    }


    private class StateReducer(private val initialViewModel: HomeViewModel) : ObservableTransformer<HomeResult, HomeViewModel> {

        override fun apply(upstream: Observable<HomeResult>): ObservableSource<HomeViewModel> {
            return upstream.scan(initialViewModel) { viewModel, result ->
                when (result) {
                    is HomeResult.GetUsers -> {
                        val (isInFlight, isError, _, _, users1) = result.response
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
                    }
                    is HomeResult.ClickUser -> return@scan viewModel.copy(showUserDialog = true,
                            dialogUser = result.user, isRecreate = false, initialize = false)
                    is HomeResult.ClickOkUserDialog -> return@scan viewModel.copy(showUserDialog = false,
                            dialogUser = null, isRecreate = false, initialize = false)
                    is HomeResult.CancelUserDialog -> return@scan viewModel.copy(showUserDialog = false,
                            dialogUser = null, isRecreate = false, initialize = false)
                    is HomeResult.Recreate -> return@scan viewModel.copy(isRecreate = true, initialize = true)
                }
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
