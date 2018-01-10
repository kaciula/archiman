package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.infrastructure.data.local.system.LatLng
import com.kaciula.archiman.presentation.util.ElmState

data class UserDetailsState(
        val initialize: Boolean = false,
        val userName: String,
        val isProgressLocation: Boolean = false,
        val isErrorLocation: Boolean = false,
        val isContentLocation: Boolean = false,
        val lastKnownLocation: LatLng = LatLng.UNAVAILABLE
) : ElmState()