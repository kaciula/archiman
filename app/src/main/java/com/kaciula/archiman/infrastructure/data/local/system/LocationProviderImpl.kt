package com.kaciula.archiman.infrastructure.data.local.system

import android.annotation.SuppressLint
import android.content.Context
import android.location.Location
import com.google.android.gms.common.api.ApiException
import com.google.android.gms.common.api.ResolvableApiException
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationRequest
import com.google.android.gms.location.LocationServices
import com.google.android.gms.location.LocationSettingsRequest
import com.google.android.gms.tasks.OnCompleteListener
import com.kaciula.archiman.domain.boundary.infrastructure.LatLng
import com.kaciula.archiman.domain.boundary.infrastructure.LocationProvider
import com.kaciula.archiman.domain.boundary.infrastructure.LocationSettingsNeeded
import io.reactivex.Single
import timber.log.Timber

class LocationProviderImpl(
    private val context: Context
) : LocationProvider {

    private val locationClient: FusedLocationProviderClient =
        LocationServices.getFusedLocationProviderClient(context)
    lateinit var settingsResolvableApiException: ResolvableApiException

    @SuppressLint("MissingPermission")
    override fun getLastKnownLocation(): Single<LatLng> {
        return Single.create { emitter ->
            val completeListener = OnCompleteListener<Location?> { task ->
                if (task.isSuccessful) {
                    val location = task.result
                    val latLng = if (location != null) LatLng.Value(
                        location.latitude,
                        location.longitude
                    ) else LatLng.UNAVAILABLE
                    emitter.onSuccess(latLng)
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

    override fun checkNeededSettingsAvailable(): Single<LocationSettingsNeeded> {
        return Single.create { emitter ->
            val locationRequest = LocationRequest.create()
                .apply {
                    interval = 10000
                    fastestInterval = 5000
                    priority = LocationRequest.PRIORITY_HIGH_ACCURACY
                }
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