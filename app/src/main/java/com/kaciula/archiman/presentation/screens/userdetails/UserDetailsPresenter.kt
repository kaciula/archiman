package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.domain.boundary.infrastructure.LatLng
import com.kaciula.archiman.domain.boundary.infrastructure.LocationProvider
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.util.*
import io.reactivex.Single
import io.reactivex.disposables.CompositeDisposable
import timber.log.Timber

class UserDetailsPresenter(
    private val view: UserDetailsContract.View,
    private val user: UserViewModel,
    private val locationProvider: LocationProvider,
    private val schedulerProvider: SchedulerProvider
) : UserDetailsContract.Presenter {

    private val elm: Elm<UserDetailsState> = Elm()
    private val disposables: CompositeDisposable = CompositeDisposable()

    init {
        Timber.i("Created user details presenter")
    }

    override fun onInit() {
        val initialState = UserDetailsState(initialize = true, userName = user.name)
        disposables.add(elm.init(initialState, this))
        elm.accept(InitMsg)
        elm.accept(GetLastKnownLocationMsg)
    }

    override fun onAttach() {}

    override fun onDetach() {}

    override fun onTerminate() {
        disposables.clear()
    }

    override fun update(msg: Msg, state: UserDetailsState): Pair<UserDetailsState, Cmd> {
        return when (msg) {
            is InitMsg -> msg.reduceAndCmd(state)
            is ResetInitMsg -> msg.reduceAndCmd(state)
            is GetLastKnownLocationMsg -> msg.reduceAndCmd(state)
            is LastKnownLocationMsg -> msg.reduceAndCmd(state)
            is ErrorMsg -> return when (msg.cmd) {
                is GetLastKnownLocationCmd -> Pair(
                    state.copy(
                        isProgressLocation = false,
                        isErrorLocation = true
                    ), None
                )
                else -> Pair(state, None)
            }
            else -> Pair(state, None)
        }
    }

    override fun call(cmd: Cmd): Single<Msg> {
        return when (cmd) {
            is GetLastKnownLocationCmd ->
                Single.just(0)
                    .observeOn(schedulerProvider.ui())
                    .flatMap({ _ ->
                        view.ensureLocationPermission()
                            .flatMap({ granted ->
                                if (granted) {
                                    locationProvider.getLastKnownLocation()
                                        .map { lastLocation ->
                                            LocationPermissionResult(
                                                granted,
                                                lastLocation
                                            )
                                        }
                                } else {
                                    Single.just(LocationPermissionResult(granted))
                                }
                            })
                            .map { locationPermissionResult ->
                                LastKnownLocationMsg(
                                    locationPermissionResult.lastLocation
                                )
                            }
                    })

            else -> Single.just(Idle)
        }
    }

    override fun sub(state: UserDetailsState) {
    }

    override fun render(state: UserDetailsState) {
        view.render(state)
    }
}

data class LocationPermissionResult(
    val granted: Boolean,
    val lastLocation: LatLng = LatLng.UNAVAILABLE
)
