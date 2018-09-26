package com.kaciula.archiman.presentation.screens.home.effecthandlers

import com.kaciula.archiman.domain.boundary.SchedulerProvider
import com.kaciula.archiman.presentation.screens.home.domain.HomeEffect
import com.kaciula.archiman.presentation.screens.home.domain.HomeEvent
import com.kaciula.archiman.presentation.screens.main.Coordinator
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.ObservableTransformer

class HomeEffectHandlers(
    private val schedulerProvider: SchedulerProvider,
    private val coordinator: Coordinator
) {

    fun build(): ObservableTransformer<HomeEffect, HomeEvent> {
        return RxMobius
            .subtypeEffectHandler<HomeEffect, HomeEvent>()
            .build()
    }
}