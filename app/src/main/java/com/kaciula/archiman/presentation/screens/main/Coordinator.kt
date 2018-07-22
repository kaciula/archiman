package com.kaciula.archiman.presentation.screens.main

import com.kaciula.archiman.presentation.screens.home.UserViewModel

interface Coordinator {

    fun start()

    fun showHome()

    fun handleBack(): Boolean

    fun showUserInfoDialog(user: UserViewModel)

    fun showUserInfoOkDialog(title: String, description: String)

    fun goToUserDetailsScreen(user: UserViewModel)
}
