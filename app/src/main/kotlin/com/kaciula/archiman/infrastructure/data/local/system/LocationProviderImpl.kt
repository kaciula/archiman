package com.kaciula.archiman.infrastructure.data.local.system

import android.annotation.SuppressLint
import android.content.Context
import android.location.Location
import com.google.android.gms.common.api.ApiException
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import com.google.android.gms.tasks.OnCompleteListener
import com.kaciula.archiman.domain.boundary.infrastructure.LatLng
import com.kaciula.archiman.domain.boundary.infrastructure.LocationProvider
import io.reactivex.Single
import timber.log.Timber

class LocationProviderImpl(context: Context) : LocationProvider {

    private val locationClient: FusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(context)

    @SuppressLint("MissingPermission")
    override fun getLastKnownLocation(): Single<LatLng> {
        return Single.create({ emitter ->
            val completeListener = OnCompleteListener<Location?> { task ->
                if (task.isSuccessful) {
                    val location = task.result
                    val latLng = if (location != null) LatLng(location.latitude, location.longitude) else LatLng.UNAVAILABLE
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
        })
    }
}