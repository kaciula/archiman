package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.domain.boundary.infrastructure.LatLng
import com.kaciula.archiman.presentation.util.*

// Commands
object GetLastKnownLocationCmd : Cmd()

// Messages
sealed class UserDetailsMsg : Msg() {
    abstract fun reduceAndCmd(oldState: UserDetailsState): Pair<UserDetailsState, Cmd>
}

sealed class UserDetailsHighPriorityMsg : HighPriorityMsg() {
    abstract fun reduceAndCmd(oldState: UserDetailsState): Pair<UserDetailsState, Cmd>
}

object InitMsg : UserDetailsMsg() {
    override fun reduceAndCmd(oldState: UserDetailsState): Pair<UserDetailsState, Cmd> {
        return Pair(oldState, OneShotCmd(ResetInitMsg))
    }
}

object ResetInitMsg : UserDetailsHighPriorityMsg() {
    override fun reduceAndCmd(oldState: UserDetailsState): Pair<UserDetailsState, Cmd> {
        val state = oldState.copy(initialize = false)
        return Pair(state, None)
    }
}

object GetLastKnownLocationMsg : UserDetailsMsg() {
    override fun reduceAndCmd(oldState: UserDetailsState): Pair<UserDetailsState, Cmd> {
        return Pair(oldState.copy(isProgressLocation = true, isErrorLocation = false, isContentLocation = false), GetLastKnownLocationCmd)
    }
}

data class LastKnownLocationMsg(private val lastLocation: LatLng) : UserDetailsMsg() {
    override fun reduceAndCmd(oldState: UserDetailsState): Pair<UserDetailsState, Cmd> {
        return Pair(oldState.copy(isProgressLocation = false, isContentLocation = true, lastKnownLocation = lastLocation), None)
    }
}