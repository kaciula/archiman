package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.domain.boundary.infrastructure.LatLng
import com.kaciula.archiman.domain.boundary.infrastructure.LocationProvider
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.infrastructure.util.MobiusLogger
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.spotify.mobius.android.MobiusAndroid
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.ObservableTransformer
import java.util.concurrent.TimeUnit

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
    private val loopFactory = RxMobius
        .loop(UserDetailsUpdate(), effectHandler)
        .init(UserDetailsInit())
        .logger(MobiusLogger())
    private val controller = MobiusAndroid
        .controller(loopFactory, UserDetailsModel(userName = user.name))

    override fun onInit() {
        if (!controller.isRunning) {
            controller.connect(view)
        }
        controller.start()
    }

    override fun onAttach() {
    }

    override fun onDetach() {
    }

    override fun onTerminate() {
        controller.stop()
        controller.disconnect()
    }

    private fun handleGetLastKnownLocation()
            : ObservableTransformer<GetLastKnownLocation, UserDetailsEvent> {
        return ObservableTransformer { effect ->
            effect
                .flatMapSingle {
                    locationProvider.getLastKnownLocation()
                }
                .delay(10, TimeUnit.SECONDS)
                .map<UserDetailsEvent> { LastKnownLocationReceived(it) }
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
