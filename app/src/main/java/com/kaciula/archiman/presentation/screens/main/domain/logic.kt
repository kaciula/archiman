package com.kaciula.archiman.presentation.screens.main.domain

import com.spotify.mobius.*

class MainInit : Init<MainModel, MainEffect> {
    override fun init(model: MainModel): First<MainModel, MainEffect> {
        return if (model.isColdStart) {
            First.first(
                model.copy(isColdStart = false),
                Effects.effects(ShowMessage("Cold start!") as MainEffect)
            )
        } else {
            First.first(
                model,
                Effects.effects(ShowMessage("Warm start!") as MainEffect)
            )
        }
    }
}


class MainUpdate : Update<MainModel, MainEvent, MainEffect> {

    override fun update(model: MainModel, event: MainEvent): Next<MainModel, MainEffect> {
        return when (event) {
            is ScreenResumed -> checkPlayServices()
        }
    }

    private fun checkPlayServices(): Next<MainModel, MainEffect> {
        return Next.dispatch(Effects.effects(CheckPlayServices))
    }
}
