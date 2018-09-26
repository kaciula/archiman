package com.kaciula.archiman.presentation.screens.main

import android.content.Context
import android.content.Intent
import android.os.Bundle
import com.bluelinelabs.conductor.Conductor
import com.bluelinelabs.conductor.Router
import com.kaciula.archiman.R
import com.kaciula.archiman.di.KoinParam
import com.kaciula.archiman.di.ScreenContext
import com.kaciula.archiman.infrastructure.util.MobiusLogger
import com.kaciula.archiman.presentation.screens.main.domain.*
import com.kaciula.archiman.presentation.screens.main.effecthandlers.MainEffectHandlers
import com.kaciula.archiman.presentation.util.BaseActivity
import com.kaciula.archiman.presentation.util.DevDrawer
import com.spotify.mobius.Connectable
import com.spotify.mobius.Connection
import com.spotify.mobius.MobiusLoop
import com.spotify.mobius.android.MobiusAndroid
import com.spotify.mobius.functions.Consumer
import com.spotify.mobius.rx2.RxEventSources
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.subjects.PublishSubject
import kotlinx.android.synthetic.main.activity_main.*
import org.koin.android.ext.android.inject
import org.koin.android.ext.android.releaseContext
import timber.log.Timber

class MainActivity : BaseActivity(), Connectable<MainModel, MainEvent> {

    private val coordinator: Coordinator by inject()

    private val effectHandlers: MainEffectHandlers by inject { mapOf(KoinParam.ACTIVITY to this) }

    private val eventSource: PublishSubject<MainEvent> = PublishSubject.create()

    private val loopFactory = RxMobius
        .loop(MainUpdate(), effectHandlers.build())
        .init(MainInit())
        .eventSource(RxEventSources.fromObservables(eventSource))
        .logger(MobiusLogger("Main"))

    private lateinit var controller: MobiusLoop.Controller<MainModel, MainEvent>

    private lateinit var router: Router
    private lateinit var devDrawer: DevDrawer

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        setSupportActionBar(toolbar)

        router = Conductor.attachRouter(this, controller_container, savedInstanceState)
        (coordinator as CoordinatorImpl).init(router)
        coordinator.start()

        setupDevDrawer()

        controller = MobiusAndroid.controller(
            loopFactory,
            BundlePacker.resolveDefaultModel(savedInstanceState)
        )
        controller.connect(this)
    }

    override fun onResume() {
        super.onResume()
        Timber.i("Resuming ...")
        controller.start()
        publishEvent(ScreenResumed)
    }

    override fun onPause() {
        super.onPause()
        controller.stop()
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        BundlePacker.addModelToBundle(controller.model, outState)
    }

    override fun onDestroy() {
        controller.disconnect()
        releaseContext(ScreenContext.MAIN)
        super.onDestroy()
    }

    override fun onBackPressed() {
        if (!coordinator.handleBack()) {
            super.onBackPressed()
        }
    }

    override fun connect(output: Consumer<MainEvent>): Connection<MainModel> {
        return object : Connection<MainModel> {
            override fun accept(value: MainModel) {
            }

            override fun dispose() {
            }
        }
    }

    private fun setupDevDrawer() {
        devDrawer = DevDrawer(this)
    }


    private fun publishEvent(event: MainEvent) {
        eventSource.onNext(event)
    }

    companion object {
        fun getStartIntent(context: Context): Intent {
            return Intent(context, MainActivity::class.java)
        }
    }
}