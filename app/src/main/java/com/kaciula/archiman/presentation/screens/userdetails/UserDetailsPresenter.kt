package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.domain.boundary.infrastructure.LatLng
import com.kaciula.archiman.domain.boundary.infrastructure.LocationProvider
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.infrastructure.util.MobiusLogger
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.spotify.mobius.MobiusLoop
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.ObservableTransformer

class UserDetailsPresenter(
    private val view: UserDetailsContract.View,
    private val user: UserViewModel,
    private val locationProvider: LocationProvider,
    private val schedulerProvider: SchedulerProvider
) : UserDetailsContract.Presenter {

    private val effectHandler = RxMobius
        .subtypeEffectHandler<UserDetailsEffect, UserDetailsEvent>()
        .addTransformer(GetLastKnownLocation::class.java, handleGetLastKnownLocation())
        .build()
    private lateinit var loop: MobiusLoop<UserDetailsModel, UserDetailsEvent, UserDetailsEffect>

    override fun onInit() {
        loop = RxMobius.loop(UserDetailsUpdate(), effectHandler)
            .logger(MobiusLogger())
            .init(UserDetailsInit())
            .startFrom(UserDetailsModel(userName = user.name))
        loop.observe { view.render(it) }
    }

    override fun onAttach() {
    }

    override fun onDetach() {
    }

    override fun onTerminate() {
        loop.dispose()
    }

    private fun handleGetLastKnownLocation()
            : ObservableTransformer<GetLastKnownLocation, UserDetailsEvent> {
        return ObservableTransformer { effect ->
            effect.map {
                LastKnownLocationReceived(LatLng(1.2, 3.4))
            }
        }
    }
}
/*
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
}*/

data class LocationPermissionResult(
    val granted: Boolean,
    val lastLocation: LatLng = LatLng.UNAVAILABLE
)
