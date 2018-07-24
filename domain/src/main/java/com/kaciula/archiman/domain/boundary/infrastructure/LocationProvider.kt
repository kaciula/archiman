package com.kaciula.archiman.domain.boundary.infrastructure

import io.reactivex.Single

interface LocationProvider {

    fun getLastKnownLocation(): Single<LatLng>

    fun checkNeededSettingsEnabled(): Single<Boolean>
}

sealed class LatLng {
    data class Value(val latitude: Double, val longitude: Double) : LatLng()
    object UNAVAILABLE : LatLng()
}