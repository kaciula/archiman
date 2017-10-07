package com.kaciula.archiman.presentation.screen.home

import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.presentation.util.*
import io.reactivex.Single
import io.reactivex.disposables.CompositeDisposable
import timber.log.Timber

class HomePresenter(private val view: HomeContract.View,
                    private val elm: Elm,
                    private val getUsers: GetUsers) : HomeContract.Presenter {

    private val disposables: CompositeDisposable = CompositeDisposable()
    private var isFirstInit: Boolean = true

    override fun init() {
        Timber.d("presenter init")
        if (isFirstInit) {
            isFirstInit = false
            val initialState = HomeState(initialize = true)
            disposables.add(elm.init(initialState, this))
            elm.render()
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

    override fun onDoneInitialize() {
        elm.accept(DoneInitializeMsg)
    }

    override fun onClickRetry() {
        elm.accept(ClickRetryMsg)
    }

    override fun onClickUser(user: UserViewModel) {
        elm.accept(ClickUserMsg(user))
    }

    override fun onShowingUserDialog() {
        elm.accept(ShowingUserDialogMsg)
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

    override fun update(msg: Msg, state: State): Pair<State, Cmd> {
        val state = state as HomeState
        return when (msg) {
            is DoneInitializeMsg -> msg.reduceAndCmd(state)
            is GetUsersMsg -> msg.reduceAndCmd(state)
            is RecreateMsg -> Pair(msg.reduce(state), None)

            is UsersDataMsg -> msg.reduceAndCmd(state)
            is ClickRetryMsg -> msg.reduceAndCmd(state)

            is ClickUserMsg -> Pair(msg.reduce(state), None)
            is ShowingUserDialogMsg -> msg.reduceAndCmd(state)
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
                    .firstOrError()
                    .map { responseModel -> UsersDataMsg(responseModel) }
            else -> Single.just(Idle)
        }
    }

    override fun render(state: State) {
        view.render(state as HomeState)
    }
}
