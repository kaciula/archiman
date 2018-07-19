package com.kaciula.archiman.presentation.screens.main

import com.kaciula.archiman.presentation.screens.home.UserViewModel

interface Coordinator {

    fun start()

    fun showHome()

    fun handleBack(): Boolean

    fun showUserInfo(user: UserViewModel)

    fun goToUserDetailsScreen(user: UserViewModel)
}
