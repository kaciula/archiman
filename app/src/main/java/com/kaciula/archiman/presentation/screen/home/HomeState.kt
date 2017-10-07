package com.kaciula.archiman.presentation.screen.home

import com.kaciula.archiman.presentation.util.State

data class HomeState(val initialize: Boolean = false,
                     val isProgress: Boolean = false,
                     val isContent: Boolean = false,
                     val users: List<UserViewModel>? = null,
                     val isError: Boolean = false,
                     val error: Throwable? = null,
                     val showUserDialog: Boolean = false,
                     val dialogUser: UserViewModel? = null,
                     val isRecreate: Boolean = false) : State()