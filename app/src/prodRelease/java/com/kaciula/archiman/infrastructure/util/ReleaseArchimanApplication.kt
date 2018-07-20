package com.kaciula.archiman.infrastructure.util

import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import org.koin.android.ext.android.inject

class ReleaseArchimanApplication : ArchimanApplication() {

    private val crashReporter: CrashReporter by inject()

    override fun onSetup() {
        val uncaughtExceptionHandler = ArchimanUncaughtExceptionHandler(this)
        Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler)

        // FIXME: Uncomment this when set up fabric key
//        crashReporter.init()
    }
}
