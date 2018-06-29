package com.kaciula.archiman.presentation.screens.main

import com.kaciula.archiman.presentation.screens.home.HomeComponent

interface ComponentProvider {
    fun getHomeComponent(): HomeComponent
}
