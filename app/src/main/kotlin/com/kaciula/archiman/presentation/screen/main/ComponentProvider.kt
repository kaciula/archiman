package com.kaciula.archiman.presentation.screen.main

import com.kaciula.archiman.presentation.screen.home.HomeComponent

interface ComponentProvider {
    fun getHomeComponent(): HomeComponent
}
