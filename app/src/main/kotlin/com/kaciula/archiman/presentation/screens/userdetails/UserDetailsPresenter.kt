package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.infrastructure.data.local.system.LatLng
import com.kaciula.archiman.infrastructure.data.local.system.LocationProvider
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import io.reactivex.Single
import io.reactivex.disposables.CompositeDisposable
import timber.log.Timber

class UserDetailsPresenter(private val view: UserDetailsContract.View,
                           private val user: UserViewModel,
                           private val locationProvider: LocationProvider,
                           private val schedulerProvider: SchedulerProvider
) : UserDetailsContract.Presenter {

    private val disposables: CompositeDisposable = CompositeDisposable()

    override fun init() {
        view.render(UserDetailsState(user.name))

        disposables.add(view.ensureLocationPermission()
                .flatMap({ granted ->
                    if (granted) {
                        locationProvider.getLastKnownLocation()
                                .map { lastLocation -> LocationPermissionResult(granted, lastLocation) }
                    } else {
                        Single.just(LocationPermissionResult(granted))
                    }
                })
                .subscribe({ locationResult -> Timber.d("Location result = $locationResult") },
                        { Timber.d("Error getting last known location") }))
    }

    override fun start() {}

    override fun stop() {}

    override fun destroy() {
        disposables.clear()
    }
}

data class LocationPermissionResult(
        val granted: Boolean,
        val lastLocation: LatLng = LatLng.UNAVAILABLE)
