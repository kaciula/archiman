package com.kaciula.archiman.presentation.screens.main

import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.screens.userdetails.UserDetailsController

interface Coordinator {

    fun start()

    fun showHome()

    fun userDetailsController(): UserDetailsController

    fun handleBack(): Boolean

    fun showUserInfoDialog(user: UserViewModel)

    fun showUserInfoOkDialog(title: String, description: String)

    fun goToUserDetailsScreen(user: UserViewModel)
}
