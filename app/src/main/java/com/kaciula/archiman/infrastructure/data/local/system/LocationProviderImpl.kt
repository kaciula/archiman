package com.kaciula.archiman.infrastructure.data.local.system

import android.annotation.SuppressLint
import android.content.Context
import android.location.Location
import com.google.android.gms.common.api.ApiException
import com.google.android.gms.common.api.ResolvableApiException
import com.google.android.gms.location.*
import com.google.android.gms.tasks.OnCompleteListener
import com.kaciula.archiman.boundary.LatLng
import com.kaciula.archiman.boundary.LocationProvider
import com.kaciula.archiman.boundary.LocationSettingsNeeded
import io.reactivex.Single
import io.reactivex.SingleEmitter
import timber.log.Timber

class LocationProviderImpl(
    private val context: Context
) : LocationProvider {

    private val locationClient: FusedLocationProviderClient =
        LocationServices.getFusedLocationProviderClient(context)
    private val locationRequest = LocationRequest.create()
        .apply {
            interval = 2000
            fastestInterval = 0
            priority = LocationRequest.PRIORITY_HIGH_ACCURACY
        }
    lateinit var settingsResolvableApiException: ResolvableApiException

    @SuppressLint("MissingPermission")
    override fun getLastKnownLocation(): Single<LatLng> {
        return Single.create { emitter ->
            val completeListener = OnCompleteListener<Location?> { task ->
                if (task.isSuccessful) {
                    val location = task.result
                    if (location != null) {
                        emitter.onSuccess(LatLng.Value(location.latitude, location.longitude))
                    } else {
                        requestFreshLocation(emitter)
                    }
                } else {
                    if (task.exception is ApiException) {
                        val apiException = task.exception as ApiException
                        Timber.w("Exception message: ${apiException.message}")
                    } else {
                        Timber.w("Exception ${task.exception}")
                    }
                    emitter.onError(task.exception!!)
                }
            }
            locationClient.lastLocation.addOnCompleteListener(completeListener)
        }
    }

    @SuppressLint("MissingPermission")
    private fun requestFreshLocation(emitter: SingleEmitter<LatLng>) {
        locationClient
            .requestLocationUpdates(locationRequest, object : LocationCallback() {
                override fun onLocationResult(locationResult: LocationResult) {
                    locationClient.removeLocationUpdates(this)
                    val location = locationResult.lastLocation
                    emitter.onSuccess(LatLng.Value(location.latitude, location.longitude))
                }
            }, null)
    }

    override fun checkNeededSettingsAvailable(): Single<LocationSettingsNeeded> {
        return Single.create { emitter ->
            val settingsClient = LocationServices.getSettingsClient(context)
            val locationSettingsRequest =
                LocationSettingsRequest.Builder().addLocationRequest(locationRequest).build()
            settingsClient.checkLocationSettings(locationSettingsRequest)
                .addOnSuccessListener {
                    emitter.onSuccess(LocationSettingsNeeded.AVAILABLE)
                }
                .addOnFailureListener {
                    if (it is ResolvableApiException) {
                        // Location settings are not satisfied, but this can be fixed
                        // by showing the user a dialog.
                        settingsResolvableApiException = it
                        emitter.onSuccess(LocationSettingsNeeded.UNAVAILABLE_RESOLVABLE)
                    } else {
                        emitter.onSuccess(LocationSettingsNeeded.UNAVAILABLE_NO_RESOLUTION)
                    }
                }
        }
    }
}