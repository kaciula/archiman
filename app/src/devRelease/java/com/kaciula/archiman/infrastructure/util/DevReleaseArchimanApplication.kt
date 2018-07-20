package com.kaciula.archiman.infrastructure.util

import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import com.kaciula.archiman.domain.util.Timberific
import com.kaciula.archiman.presentation.util.DevDrawer
import org.koin.android.ext.android.inject

class DevReleaseArchimanApplication : ArchimanApplication() {

    private val crashReporter: CrashReporter by inject()

    override fun onSetup() {
        Timberific.init(true)
        DevDrawer.setupLogging(this)

        val uncaughtExceptionHandler = ArchimanUncaughtExceptionHandler(this)
        Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler)

        // FIXME: Uncomment this when set up fabric key
//        crashReporter.init()
    }
}
