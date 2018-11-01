package com.kaciula.archiman.presentation.screens.main

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.IntentSender
import android.os.Bundle
import com.bluelinelabs.conductor.Conductor
import com.bluelinelabs.conductor.Router
import com.google.android.gms.common.api.ResolvableApiException
import com.kaciula.archiman.R
import com.kaciula.archiman.di.KoinParam
import com.kaciula.archiman.di.ScreenContext
import com.kaciula.archiman.infrastructure.util.MobiusLogger
import com.kaciula.archiman.presentation.screens.main.domain.*
import com.kaciula.archiman.presentation.screens.main.effecthandlers.MainEffectHandlers
import com.kaciula.archiman.presentation.screens.userdetails.domain.LocationSettingsResolved
import com.kaciula.archiman.presentation.screens.userdetails.domain.LocationSettingsStillNotResolved
import com.kaciula.archiman.presentation.util.BaseActivity
import com.kaciula.archiman.presentation.util.DevDrawer
import com.kaciula.archiman.presentation.util.mobius.ProfilingLogger
import com.spotify.mobius.Connectable
import com.spotify.mobius.Connection
import com.spotify.mobius.MobiusLoop
import com.spotify.mobius.android.MobiusAndroid
import com.spotify.mobius.extras.CompositeLogger
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

    private val profilingLogger: ProfilingLogger<MainModel, MainEvent, MainEffect> =
        ProfilingLogger()

    private val loopFactory = RxMobius
        .loop(MainUpdate(), effectHandlers.build())
        .init(MainInit())
        .eventSource(RxEventSources.fromObservables(eventSource))
        .logger(CompositeLogger.from(MobiusLogger("Main"), profilingLogger))

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
        profilingLogger.printPerformance()
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

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == REQUEST_SHOW_LOCATION_SETTINGS) {
            if (resultCode == Activity.RESULT_OK) {
                coordinator.userDetailsController().publishEvent(LocationSettingsResolved)
            } else {
                coordinator.userDetailsController().publishEvent(LocationSettingsStillNotResolved)
            }
        } /*else if (requestCode == REQUEST_PLAY_SERVICES_RESOLUTION) {
            Toast.makeText(this, "Play Services resolution", Toast.LENGTH_SHORT).show()
        }*/
    }

    fun showLocationSettingsDialog(settingsResolvableApiException: ResolvableApiException) {
        try {
            // Check the result in onActivityResult()
            settingsResolvableApiException
                .startResolutionForResult(this, REQUEST_SHOW_LOCATION_SETTINGS)
        } catch (sendEx: IntentSender.SendIntentException) {
            Timber.e(sendEx, "Could not open location settings dialog")
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

private const val REQUEST_SHOW_LOCATION_SETTINGS = 1
private const val REQUEST_PLAY_SERVICES_RESOLUTION = 9000