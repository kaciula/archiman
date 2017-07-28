package com.kaciula.archiman.presentation.screen.home

data class HomeViewModel(val initialize: Boolean = false,
                         val isProgress: Boolean = false,
                         val isContent: Boolean = false,
                         val users: List<UserViewModel>? = null,
                         val isError: Boolean = false,
                         val showUserDialog: Boolean = false,
                         val dialogUser: UserViewModel? = null,
                         val isRecreate: Boolean = false)