package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.domain.boundary.infrastructure.LatLng
import com.spotify.mobius.*

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
                Effects.effects(GetLastKnownLocation as UserDetailsEffect)
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
            is LastKnownLocationReceived -> Next.next(
                model.copy(
                    isProgressGetLocation = false,
                    isErrorGetLocation = false,
                    isContentGetLocation = true,
                    lastKnownLocation = event.location
                )
            )
            LastKnownLocationRefreshRequested -> Next.next(
                model.copy(
                    isProgressGetLocation = true,
                    isErrorGetLocation = false,
                    isContentGetLocation = false
                ), Effects.effects(GetLastKnownLocation)
            )
            GetLocationPermissionDenied -> Next.dispatch(
                Effects.effects(RequestLocationPermission)
            )
            LocationPermissionGranted -> {
                if (model.isProgressGetLocation) {
                    Next.dispatch(Effects.effects(GetLastKnownLocation as UserDetailsEffect))
                } else {
                    Next.noChange()
                }
            }
            LocationPermissionDenied -> Next.dispatch(Effects.effects(RequestLocationPermission))
            LocationSettingsInsufficientResolvable -> Next.dispatch(
                Effects.effects(RequestMoreLocationSettings)
            )
            LocationSettingsInsufficientNoResolution -> Next.dispatch(
                Effects.effects(ShowLocationSettingsNoResolution)
            )
            LocationSettingsResolved ->
                if (model.isProgressGetLocation) {
                    Next.dispatch(Effects.effects(GetLastKnownLocation as UserDetailsEffect))
                } else {
                    Next.noChange()
                }
            LocationSettingsStillNotResolved -> Next.dispatch(
                Effects.effects(RequestMoreLocationSettings)
            )
        }
    }
}