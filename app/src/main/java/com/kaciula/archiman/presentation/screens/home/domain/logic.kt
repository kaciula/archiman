package com.kaciula.archiman.presentation.screens.home.domain

import com.spotify.mobius.First
import com.spotify.mobius.Init
import com.spotify.mobius.Next
import com.spotify.mobius.Update

class HomeInit : Init<HomeModel, HomeEffect> {
    override fun init(model: HomeModel): First<HomeModel, HomeEffect> {
        return First.first(model)
    }
}


class HomeUpdate : Update<HomeModel, HomeEvent, HomeEffect> {

    override fun update(model: HomeModel, event: HomeEvent): Next<HomeModel, HomeEffect> {
        return Next.noChange()
    }
}