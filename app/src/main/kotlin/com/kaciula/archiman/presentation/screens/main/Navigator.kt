package com.kaciula.archiman.presentation.screens.main

import com.kaciula.archiman.presentation.screens.home.UserViewModel

interface Navigator {

    fun goToUserDetailsScreen(user: UserViewModel)
}
