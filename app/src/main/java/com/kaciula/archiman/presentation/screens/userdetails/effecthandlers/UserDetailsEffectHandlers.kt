package com.kaciula.archiman.presentation.screens.userdetails.effecthandlers

import android.Manifest
import android.widget.Toast
import com.kaciula.archiman.domain.boundary.infrastructure.LocationProvider
import com.kaciula.archiman.domain.boundary.infrastructure.LocationSettingsNeeded
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.infrastructure.data.local.system.LocationProviderImpl
import com.kaciula.archiman.presentation.screens.main.MainActivity
import com.kaciula.archiman.presentation.screens.userdetails.UserDetailsController
import com.kaciula.archiman.presentation.screens.userdetails.domain.*
import com.spotify.mobius.rx2.RxMobius
import com.tbruyelle.rxpermissions2.RxPermissions
import io.reactivex.Completable
import io.reactivex.Observable
import io.reactivex.ObservableTransformer
import io.reactivex.Single
import java.util.concurrent.TimeUnit

class UserDetailsEffectHandlers(
    private val controller: UserDetailsController,
    private val schedulerProvider: SchedulerProvider,
    private val locationProvider: LocationProvider
) {

    fun build(): ObservableTransformer<UserDetailsEffect, UserDetailsEvent> {
        return RxMobius
            .subtypeEffectHandler<UserDetailsEffect, UserDetailsEvent>()
            .addTransformer(GetLastKnownLocation::class.java, ::handleGetLastKnownLocation)
            .addTransformer(
                RequestLocationPermission::class.java, ::handleRequestLocationPermission
            )
            .addTransformer(
                RequestMoreLocationSettings::class.java, ::handleRequestMoreLocationSettings
            )
            .addTransformer(
                ShowLocationSettingsNoResolution::class.java,
                ::handleShowLocationSettingsNoResolution
            )
            .build()
    }


    private fun handleGetLastKnownLocation(request: Observable<GetLastKnownLocation>)
            : Observable<UserDetailsEvent> {
        return request
            .observeOn(schedulerProvider.ui())
            .flatMapSingle {
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
                                                    LastKnownLocationReceived(
                                                        it
                                                    )
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

    private fun handleRequestMoreLocationSettings(request: Observable<RequestMoreLocationSettings>)
            : Observable<UserDetailsEvent> {
        return request
            .observeOn(schedulerProvider.ui())
            .flatMapCompletable {
                Completable
                    .fromAction {
                        (controller.activity as MainActivity).showLocationSettingsDialog(
                            (locationProvider as LocationProviderImpl).settingsResolvableApiException
                        )
                    }
            }
            .toObservable()
    }

    private fun handleShowLocationSettingsNoResolution(request: Observable<ShowLocationSettingsNoResolution>)
            : Observable<UserDetailsEvent> {
        return request
            .observeOn(schedulerProvider.ui())
            .flatMapCompletable {
                Completable
                    .fromAction {
                        Toast.makeText(
                            controller.activity,
                            "The device does not have the necessary capabilities for the location feature!",
                            Toast.LENGTH_SHORT
                        ).show()
                    }
            }
            .toObservable()
    }
}