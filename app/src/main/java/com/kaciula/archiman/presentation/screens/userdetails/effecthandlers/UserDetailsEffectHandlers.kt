package com.kaciula.archiman.presentation.screens.userdetails.effecthandlers

import android.Manifest
import com.kaciula.archiman.boundary.LocationProvider
import com.kaciula.archiman.boundary.LocationSettingsNeeded
import com.kaciula.archiman.boundary.SchedulerProvider
import com.kaciula.archiman.infrastructure.data.local.system.LocationProviderImpl
import com.kaciula.archiman.presentation.screens.main.Coordinator
import com.kaciula.archiman.presentation.screens.main.MainActivity
import com.kaciula.archiman.presentation.screens.userdetails.UserDetailsController
import com.kaciula.archiman.presentation.screens.userdetails.domain.*
import com.spotify.mobius.rx2.RxMobius
import com.tbruyelle.rxpermissions2.RxPermissions
import io.reactivex.Observable
import io.reactivex.ObservableTransformer
import io.reactivex.Single
import io.reactivex.functions.Action
import java.util.concurrent.TimeUnit

class UserDetailsEffectHandlers(
    private val controller: UserDetailsController,
    private val schedulerProvider: SchedulerProvider,
    private val locationProvider: LocationProvider,
    private val coordinator: Coordinator
) {

    fun build(): ObservableTransformer<UserDetailsEffect, UserDetailsEvent> {
        return RxMobius
            .subtypeEffectHandler<UserDetailsEffect, UserDetailsEvent>()
            .addTransformer(GetLastKnownLocation::class.java, ::handleGetLastKnownLocation)
            .addTransformer(
                RequestLocationPermission::class.java,
                ::handleRequestLocationPermission
            )
            .addAction(
                RequestMoreLocationSettings::class.java,
                showLocationSettingsDialog,
                schedulerProvider.ui()
            )
            .addAction(
                ShowLocationSettingsNoResolution::class.java,
                showLocationSettingsNoResolution,
                schedulerProvider.ui()
            )
            .build()
    }


    private fun handleGetLastKnownLocation(request: Observable<GetLastKnownLocation>)
            : Observable<UserDetailsEvent> {
        return request
            .observeOn(schedulerProvider.ui())
            .flatMapSingle { _ ->
                ensureLocationPermission()
                    .flatMap { granted ->
                        if (granted) {
                            locationProvider
                                .checkNeededSettingsAvailable()
                                .flatMap { locationSettingsNeeded ->
                                    when (locationSettingsNeeded) {
                                        LocationSettingsNeeded.AVAILABLE ->
                                            locationProvider.getLastKnownLocation()
                                                .map<UserDetailsEvent> {
                                                    LastKnownLocationReceived(it)
                                                }
                                                .delay(10, TimeUnit.SECONDS)
                                        LocationSettingsNeeded.UNAVAILABLE_RESOLVABLE -> Single.just(
                                            LocationSettingsInsufficientResolvable
                                        )
                                        LocationSettingsNeeded.UNAVAILABLE_NO_RESOLUTION -> Single.just(
                                            LocationSettingsInsufficientNoResolution
                                        )
                                    }
                                }
                        } else {
                            Single.just(GetLocationPermissionDenied)
                        }
                    }
            }
    }

    private fun handleRequestLocationPermission(request: Observable<RequestLocationPermission>)
            : Observable<UserDetailsEvent> {
        return request
            .observeOn(schedulerProvider.ui())
            .flatMapSingle {
                ensureLocationPermission()
                    .map { granted ->
                        if (granted) {
                            LocationPermissionGranted
                        } else {
                            LocationPermissionDenied
                        }
                    }
            }
    }

    private fun ensureLocationPermission(): Single<Boolean> {
        return RxPermissions(controller.activity!!)
            .request(Manifest.permission.ACCESS_FINE_LOCATION)
            .first(false)
    }

    private val showLocationSettingsNoResolution = Action {
        showToast("The device does not have the necessary capabilities for the location feature!")
    }

    private fun showToast(message: String) {
        coordinator.showToast(message)
    }

    private val showLocationSettingsDialog = Action {
        (controller.activity as MainActivity).showLocationSettingsDialog(
            (locationProvider as LocationProviderImpl).settingsResolvableApiException
        )
    }
}