package com.kaciula.archiman.presentation.screens.main

import com.kaciula.archiman.presentation.screens.home.UserViewModel

interface Coordinator {

    fun goToUserDetailsScreen(user: UserViewModel)
}
