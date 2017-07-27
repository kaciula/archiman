package com.kaciula.archiman.presentation.screen.main

import com.kaciula.archiman.presentation.screen.home.UserViewModel

interface Navigator {

    fun goToUserDetailsScreen(user: UserViewModel)
}
