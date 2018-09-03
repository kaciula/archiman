package com.kaciula.archiman.presentation.screens.home

import android.arch.lifecycle.Lifecycle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.kaciula.archiman.R
import com.kaciula.archiman.di.ScreenContext
import com.kaciula.archiman.infrastructure.util.MobiusLogger
import com.kaciula.archiman.presentation.screens.home.domain.*
import com.kaciula.archiman.presentation.screens.home.effecthandlers.HomeEffectHandlers
import com.kaciula.archiman.presentation.screens.home.view.HomeView
import com.kaciula.archiman.presentation.util.conductor.BaseController
import com.spotify.mobius.android.MobiusAndroid
import com.spotify.mobius.rx2.RxEventSources
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.Observable
import io.reactivex.subjects.PublishSubject
import org.joda.time.LocalDateTime
import org.koin.standalone.inject
import org.koin.standalone.releaseContext
import java.util.concurrent.TimeUnit

class HomeController : BaseController() {

    private val effectHandlers: HomeEffectHandlers by inject()

    private val lifecycleAwarePoll = lifecycleObservable()
        .switchMap { state ->
            if (state == Lifecycle.State.RESUMED) {
                Observable.interval(10, 10, TimeUnit.SECONDS)
                    .switchMap { Observable.just(LocalDateTime()) }
            } else {
                Observable.empty()
            }
        }
        .map { TimeTickEvent(it) as HomeEvent }

    private val eventSource: PublishSubject<HomeEvent> = PublishSubject.create()

    private val loopFactory = RxMobius
        .loop(HomeUpdate(), effectHandlers.build())
        .init(HomeInit())
        .eventSource(RxEventSources.fromObservables(eventSource, lifecycleAwarePoll))
        .logger(MobiusLogger())

    private val controller = MobiusAndroid.controller(loopFactory, HomeModel())

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup): View {
        val theView = HomeView(inflater, container, activity!!)
        controller.connect(theView)
        controller.start()
        return theView.containerView!!
    }

    override fun onDestroyView(view: View) {
        controller.stop()
        controller.disconnect()
        super.onDestroyView(view)
    }

    override fun onDestroy() {
        releaseContext(ScreenContext.HOME)
        super.onDestroy()
    }

    fun dialogRouter() = getChildRouter(view!!.findViewById(R.id.containerDialogs))

    fun publishEvent(event: HomeEvent) {
        eventSource.onNext(event)
    }
}