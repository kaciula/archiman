package com.kaciula.archiman.domain.boundary.infrastructure

import io.reactivex.Single

interface LocationProvider {

    fun getLastKnownLocation(): Single<LatLng>
}

data class LatLng(val latitude: Double, val longitude: Double) {

    companion object {
        @JvmField
        val UNAVAILABLE = LatLng(0.0, 0.0)
    }
}