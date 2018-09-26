package com.kaciula.archiman.domain.boundary

import io.reactivex.Single

interface LocationProvider {

    fun getLastKnownLocation(): Single<LatLng>

    fun checkNeededSettingsAvailable(): Single<LocationSettingsNeeded>
}

sealed class LatLng {
    data class Value(val latitude: Double, val longitude: Double) : LatLng()
    object UNAVAILABLE : LatLng()
}

enum class LocationSettingsNeeded {
    AVAILABLE, UNAVAILABLE_RESOLVABLE, UNAVAILABLE_NO_RESOLUTION
}