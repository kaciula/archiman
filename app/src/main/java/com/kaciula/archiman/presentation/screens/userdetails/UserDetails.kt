package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.domain.boundary.infrastructure.LatLng
import com.spotify.mobius.Effects.effects
import com.spotify.mobius.First
import com.spotify.mobius.Init
import com.spotify.mobius.Next
import com.spotify.mobius.Next.*
import com.spotify.mobius.Update

data class UserDetailsModel(
    val userName: String,
    val isProgressGetLocation: Boolean = false,
    val isContentGetLocation: Boolean = false,
    val isErrorGetLocation: Boolean = false,
    val lastKnownLocation: LatLng = LatLng.UNAVAILABLE
)


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

sealed class UserDetailsEffect
object GetLastKnownLocation : UserDetailsEffect()
object RequestLocationPermission : UserDetailsEffect()
object RequestMoreLocationSettings : UserDetailsEffect()
object ShowLocationSettingsNoResolution : UserDetailsEffect()

class UserDetailsInit : Init<UserDetailsModel, UserDetailsEffect> {
    override fun init(model: UserDetailsModel): First<UserDetailsModel, UserDetailsEffect> {
        if (!model.isContentGetLocation) {
            return First.first(
                model.copy(isProgressGetLocation = true, isErrorGetLocation = false),
                effects(GetLastKnownLocation as UserDetailsEffect)
            )
        }
        return First.first(model)
    }
}


class UserDetailsUpdate : Update<UserDetailsModel, UserDetailsEvent, UserDetailsEffect> {

    override fun update(
        model: UserDetailsModel,
        event: UserDetailsEvent
    ): Next<UserDetailsModel, UserDetailsEffect> {
        return when (event) {
            is LastKnownLocationReceived -> onLastKnownLocationReceived(model, event)
            LastKnownLocationRefreshRequested -> onLastKnownLocationRefreshRequested(model)
            GetLocationPermissionDenied -> requestLocationPermission()
            LocationPermissionGranted -> onLocationPermissionGranted(model)
            LocationPermissionDenied -> requestLocationPermission()
            LocationSettingsInsufficientResolvable -> requestMoreLocationSettings()
            LocationSettingsInsufficientNoResolution -> showLocationSettingsNoResolution()
            LocationSettingsResolved -> onLocationSettingsResolved(model)
            LocationSettingsStillNotResolved -> requestMoreLocationSettings()
        }
    }

    private fun onLastKnownLocationReceived(
        model: UserDetailsModel,
        event: LastKnownLocationReceived
    ): Next<UserDetailsModel, UserDetailsEffect> {
        return next(
            model.copy(
                isProgressGetLocation = false,
                isErrorGetLocation = false,
                isContentGetLocation = true,
                lastKnownLocation = event.location
            )
        )
    }

    private fun onLastKnownLocationRefreshRequested(
        model: UserDetailsModel
    ): Next<UserDetailsModel, UserDetailsEffect> {
        return next(
            model.copy(
                isProgressGetLocation = true,
                isErrorGetLocation = false,
                isContentGetLocation = false
            ), effects(GetLastKnownLocation)
        )
    }

    private fun requestLocationPermission(): Next<UserDetailsModel, UserDetailsEffect> {
        return dispatch(effects(RequestLocationPermission))
    }

    private fun onLocationPermissionGranted(model: UserDetailsModel): Next<UserDetailsModel, UserDetailsEffect> {
        return if (model.isProgressGetLocation) {
            dispatch(effects(GetLastKnownLocation as UserDetailsEffect))
        } else {
            noChange()
        }
    }

    private fun requestMoreLocationSettings(): Next<UserDetailsModel, UserDetailsEffect> {
        return dispatch(effects(RequestMoreLocationSettings))
    }

    private fun showLocationSettingsNoResolution(): Next<UserDetailsModel, UserDetailsEffect> {
        return dispatch(effects(ShowLocationSettingsNoResolution))
    }

    private fun onLocationSettingsResolved(model: UserDetailsModel): Next<UserDetailsModel, UserDetailsEffect> {
        return if (model.isProgressGetLocation) {
            dispatch(effects(GetLastKnownLocation as UserDetailsEffect))
        } else {
            noChange()
        }
    }
}