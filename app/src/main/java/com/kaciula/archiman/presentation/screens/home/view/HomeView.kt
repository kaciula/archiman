package com.kaciula.archiman.presentation.screens.home.view

import android.app.Activity
import android.view.LayoutInflater
import android.view.ViewGroup
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.screens.home.domain.HomeEvent
import com.kaciula.archiman.presentation.screens.home.domain.HomeModel
import com.kaciula.archiman.presentation.util.KotlinView
import com.spotify.mobius.Connectable
import com.spotify.mobius.Connection
import com.spotify.mobius.functions.Consumer

class HomeView(
    inflater: LayoutInflater,
    container: ViewGroup,
    private val activity: Activity
) : KotlinView(R.layout.controller_home, inflater, container),
    Connectable<HomeModel, HomeEvent> {

    override fun connect(output: Consumer<HomeEvent>): Connection<HomeModel> {
        initialize(output)

        return object : Connection<HomeModel> {
            override fun accept(value: HomeModel) {
                render(value)
            }

            override fun dispose() {
                tearDown()
            }
        }
    }

    private fun initialize(output: Consumer<HomeEvent>) {
    }

    private fun render(model: HomeModel) {
    }

    override fun tearDown() {
        super.tearDown()
    }
}