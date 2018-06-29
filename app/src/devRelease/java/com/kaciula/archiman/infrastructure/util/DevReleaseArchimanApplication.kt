package com.kaciula.archiman.infrastructure.util

import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import com.kaciula.archiman.domain.util.Timberific
import com.kaciula.archiman.injection.Injector
import com.kaciula.archiman.presentation.util.DevDrawer
import javax.inject.Inject

class DevReleaseArchimanApplication : ArchimanApplication() {

    @Inject
    lateinit var crashReporter: CrashReporter

    override fun onSetup() {
        Injector.appComponent.inject(this)

        Timberific.init(true)
        DevDrawer.setupLogging(this)

        val uncaughtExceptionHandler = ArchimanUncaughtExceptionHandler(this)
        Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler)

        // FIXME: Uncomment this when set up fabric key
//        crashReporter.init()
    }
}
