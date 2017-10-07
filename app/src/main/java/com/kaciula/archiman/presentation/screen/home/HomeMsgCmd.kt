package com.kaciula.archiman.presentation.screen.home

import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.presentation.util.Cmd
import com.kaciula.archiman.presentation.util.Msg
import com.kaciula.archiman.presentation.util.None
import java.util.*

// Commands
object GetUsersCmd : Cmd()

// Messages
object FirstInitMsg : Msg() {
    fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        val state = oldState.copy(isProgress = true, initialize = false)
        return Pair(state, GetUsersCmd)
    }
}

data class UsersDataMsg(private val response: GetUsers.ResponseModel) : Msg() {
    fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        val users = ArrayList<UserViewModel>(response.users.size)
        for ((_, name) in response.users) {
            users.add(UserViewModel(name))
        }
        return Pair(HomeState(isContent = true, users = users), None)
    }
}

data class ClickUserMsg(private val user: UserViewModel) : Msg() {
    fun reduce(oldState: HomeState): HomeState {
        return oldState.copy(showUserDialog = true, dialogUser = user, isRecreate = false, initialize = false)
    }
}

object ClickOkUserDialogMsg : Msg() {
    fun reduce(oldState: HomeState): HomeState {
        return oldState.copy(showUserDialog = false, dialogUser = null, isRecreate = false, initialize = false)
    }
}

object CancelUserDialogMsg : Msg() {
    fun reduce(oldState: HomeState): HomeState {
        return oldState.copy(showUserDialog = false, dialogUser = null, isRecreate = false, initialize = false)
    }
}

object ClickRetryMsg : Msg() {
    fun reduceAndCmd(oldState: HomeState): Pair<HomeState, Cmd> {
        val state = oldState.copy(isProgress = true)
        return Pair(state, GetUsersCmd)
    }
}

/* This event is triggered whenever there is an orientation change or we're coming back to this screen */
object RecreateMsg : Msg() {
    fun reduce(oldState: HomeState): HomeState {
        return oldState.copy(isRecreate = true, initialize = true)
    }
}
