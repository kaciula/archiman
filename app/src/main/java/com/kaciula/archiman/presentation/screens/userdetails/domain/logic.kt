package com.kaciula.archiman.presentation.screens.userdetails.domain

import com.spotify.mobius.*

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
        return Next.next(
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
        return Next.next(
            model.copy(
                isProgressGetLocation = true,
                isErrorGetLocation = false,
                isContentGetLocation = false
            ), Effects.effects(GetLastKnownLocation)
        )
    }

    private fun requestLocationPermission(): Next<UserDetailsModel, UserDetailsEffect> {
        return Next.dispatch(Effects.effects(RequestLocationPermission))
    }

    private fun onLocationPermissionGranted(model: UserDetailsModel): Next<UserDetailsModel, UserDetailsEffect> {
        return if (model.isProgressGetLocation) {
            Next.dispatch(Effects.effects(GetLastKnownLocation as UserDetailsEffect))
        } else {
            Next.noChange()
        }
    }

    private fun requestMoreLocationSettings(): Next<UserDetailsModel, UserDetailsEffect> {
        return Next.dispatch(Effects.effects(RequestMoreLocationSettings))
    }

    private fun showLocationSettingsNoResolution(): Next<UserDetailsModel, UserDetailsEffect> {
        return Next.dispatch(Effects.effects(ShowLocationSettingsNoResolution))
    }

    private fun onLocationSettingsResolved(model: UserDetailsModel): Next<UserDetailsModel, UserDetailsEffect> {
        return if (model.isProgressGetLocation) {
            Next.dispatch(Effects.effects(GetLastKnownLocation as UserDetailsEffect))
        } else {
            Next.noChange()
        }
    }
}