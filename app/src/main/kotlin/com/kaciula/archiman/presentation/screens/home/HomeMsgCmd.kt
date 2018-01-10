package com.kaciula.archiman.presentation.screens.home

import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.presentation.util.*
import java.util.*

// Commands
object GetUsersCmd : Cmd()

// Messages
sealed class HomeMsg : Msg() {
    abstract fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd>
}

sealed class HomeHighPriorityMsg : HighPriorityMsg() {
    abstract fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd>
}

object InitMsg : HomeMsg() {
    override fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        return Pair(oldState, OneShotCmd(ResetInitMsg))
    }
}

object GetUsersMsg : HomeMsg() {
    override fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        val state = oldState.copy(isProgress = true, isContent = false, isError = false)
        return Pair(state, GetUsersCmd)
    }
}

data class UsersDataMsg(private val response: GetUsers.ResponseModel) : HomeMsg() {
    override fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        val users = ArrayList<UserViewModel>(response.users.size)
        for ((_, name) in response.users) {
            users.add(UserViewModel(name))
        }
        return Pair(HomeState(isContent = true, users = users), None)
    }
}

data class ClickUserMsg(private val user: UserViewModel) : HomeMsg() {
    override fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        return Pair(oldState.copy(showUserDialog = true, dialogUser = user), OneShotCmd(ResetClickUserMsg))
    }
}

object ResetClickUserMsg : HomeHighPriorityMsg() {
    override fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> =
            Pair(oldState.copy(showUserDialog = false, dialogUser = null), None)
}

object ClickOkUserDialogMsg : HomeMsg() {
    override fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        return Pair(oldState.copy(), None)
    }
}

object CancelUserDialogMsg : HomeMsg() {
    override fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        return Pair(oldState.copy(), None)
    }
}

object ClickRetryMsg : HomeMsg() {
    override fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        val state = oldState.copy(isProgress = true, isContent = false, isError = false)
        return Pair(state, GetUsersCmd)
    }
}

/* This event is triggered whenever there is an orientation change or we're coming back to this screen */
object RecreateMsg : HomeMsg() {
    override fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        return Pair(oldState.copy(initialize = true), OneShotCmd(ResetInitMsg))
    }
}

object ResetInitMsg : HomeHighPriorityMsg() {
    override fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        val state = oldState.copy(initialize = false)
        return Pair(state, None)
    }
}
