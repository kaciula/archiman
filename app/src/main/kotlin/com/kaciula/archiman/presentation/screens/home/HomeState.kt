package com.kaciula.archiman.presentation.screens.home

import com.kaciula.archiman.presentation.util.ElmState

data class HomeState(val initialize: Boolean = false,
                     val isProgress: Boolean = false,
                     val isContent: Boolean = false,
                     val users: List<UserViewModel>? = null,
                     val isError: Boolean = false,
                     val error: Throwable? = null,
                     val showUserDialog: Boolean = false,
                     val dialogUser: UserViewModel? = null) : ElmState()