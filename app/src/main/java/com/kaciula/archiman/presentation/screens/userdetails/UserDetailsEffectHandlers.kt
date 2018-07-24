package com.kaciula.archiman.presentation.screens.userdetails

import android.Manifest
import android.widget.Toast
import com.bluelinelabs.conductor.Controller
import com.kaciula.archiman.domain.boundary.infrastructure.LocationProvider
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.spotify.mobius.rx2.RxMobius
import com.tbruyelle.rxpermissions2.RxPermissions
import io.reactivex.Completable
import io.reactivex.Observable
import io.reactivex.ObservableTransformer
import io.reactivex.Single
import java.util.concurrent.TimeUnit

class UserDetailsEffectHandlers(
    private val controller: Controller,
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
                                .checkNeededSettingsEnabled()
                                .flatMap { hasNeededSettingsEnabled ->
                                    if (hasNeededSettingsEnabled) {
                                        locationProvider.getLastKnownLocation()
                                            .map<UserDetailsEvent> { LastKnownLocationReceived(it) }
                                            .delay(10, TimeUnit.SECONDS)
                                    } else {
                                        Single.just(LocationSettingsInsufficient)
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
                        Toast.makeText(
                            controller.activity,
                            "Not enough location settings",
                            Toast.LENGTH_SHORT
                        ).show()
                    }
            }
            .toObservable()
    }
}