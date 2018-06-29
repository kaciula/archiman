package com.kaciula.archiman.infrastructure.util

import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import com.kaciula.archiman.injection.Injector
import javax.inject.Inject

class ReleaseArchimanApplication : ArchimanApplication() {

    @Inject
    lateinit var crashReporter: CrashReporter

    override fun onSetup() {
        Injector.appComponent.inject(this)

        val uncaughtExceptionHandler = ArchimanUncaughtExceptionHandler(this)
        Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler)

        // FIXME: Uncomment this when set up fabric key
//        crashReporter.init()
    }
}
