package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.domain.boundary.infrastructure.LatLng
import com.spotify.mobius.*

data class UserDetailsModel(
    val userName: String,
    val isProgressGetLocation: Boolean = false,
    val isContentGetLocation: Boolean = false,
    val isErrorGetLocation: Boolean = false,
    val lastKnownLocation: LatLng = LatLng.UNAVAILABLE,
    val getLocationWaitingForPermission: Boolean = false
)


sealed class UserDetailsEvent
data class LastKnownLocationReceived(val location: LatLng) : UserDetailsEvent()
object LastKnownLocationRefreshRequested : UserDetailsEvent()
object GetLocationPermissionDenied : UserDetailsEvent()
object LocationPermissionDenied : UserDetailsEvent()
object LocationPermissionGranted : UserDetailsEvent()

sealed class UserDetailsEffect
object GetLastKnownLocation : UserDetailsEffect()
object RequestLocationPermission : UserDetailsEffect()


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
            is LastKnownLocationRefreshRequested -> Next.next(
                model.copy(
                    isProgressGetLocation = true,
                    isErrorGetLocation = false,
                    isContentGetLocation = false
                ), Effects.effects(GetLastKnownLocation)
            )
            is GetLocationPermissionDenied -> Next.next(
                model.copy(getLocationWaitingForPermission = true),
                Effects.effects(RequestLocationPermission)
            )
            is LocationPermissionGranted -> {
                if (model.getLocationWaitingForPermission) {
                    Next.next(
                        model.copy(getLocationWaitingForPermission = false),
                        Effects.effects(GetLastKnownLocation as UserDetailsEffect)
                    )
                } else {
                    Next.noChange()
                }

            }
            is LocationPermissionDenied -> Next.dispatch(Effects.effects(RequestLocationPermission))
        }
    }
}