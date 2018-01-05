package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.infrastructure.data.local.system.LatLng

data class UserDetailsState(
        val userName: String,
        val isProgressLocation: Boolean = false,
        val isErrorLocation: Boolean = false,
        val lastKnownLocation: LatLng = LatLng.UNAVAILABLE)