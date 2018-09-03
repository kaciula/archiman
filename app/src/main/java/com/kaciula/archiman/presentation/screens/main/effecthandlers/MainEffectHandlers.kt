package com.kaciula.archiman.presentation.screens.main.effecthandlers

import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.presentation.screens.main.Coordinator
import com.kaciula.archiman.presentation.screens.main.domain.MainEffect
import com.kaciula.archiman.presentation.screens.main.domain.MainEvent
import com.kaciula.archiman.presentation.screens.main.domain.ShowMessage
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.ObservableTransformer

class MainEffectHandlers(
    private val coordinator: Coordinator,
    private val schedulerProvider: SchedulerProvider
) {

    fun build(): ObservableTransformer<MainEffect, MainEvent> {
        return RxMobius
            .subtypeEffectHandler<MainEffect, MainEvent>()
            .addConsumer(ShowMessage::class.java, ::showToast, schedulerProvider.ui())
            .build()
    }

    private fun showToast(effect: ShowMessage) {
        coordinator.showToast(effect.text)
    }
}