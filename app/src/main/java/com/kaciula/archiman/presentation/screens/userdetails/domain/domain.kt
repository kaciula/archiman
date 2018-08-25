package com.kaciula.archiman.presentation.screens.userdetails.domain

import com.kaciula.archiman.domain.boundary.infrastructure.LatLng

/** State definition **/
data class UserDetailsModel(
    val userName: String,
    val isProgressGetLocation: Boolean = false,
    val isContentGetLocation: Boolean = false,
    val isErrorGetLocation: Boolean = false,
    val lastKnownLocation: LatLng = LatLng.UNAVAILABLE
)

/** Things we react to **/
sealed class UserDetailsEvent

data class LastKnownLocationReceived(val location: LatLng) : UserDetailsEvent()
object LastKnownLocationRefreshRequested : UserDetailsEvent()
object GetLocationPermissionDenied : UserDetailsEvent()
object LocationPermissionDenied : UserDetailsEvent()
object LocationPermissionGranted : UserDetailsEvent()
object LocationSettingsInsufficientResolvable : UserDetailsEvent()
object LocationSettingsInsufficientNoResolution : UserDetailsEvent()
object LocationSettingsResolved : UserDetailsEvent()
object LocationSettingsStillNotResolved : UserDetailsEvent()

/** Things we'll do **/
sealed class UserDetailsEffect

object GetLastKnownLocation : UserDetailsEffect()
object RequestLocationPermission : UserDetailsEffect()
object RequestMoreLocationSettings : UserDetailsEffect()
object ShowLocationSettingsNoResolution : UserDetailsEffect()

