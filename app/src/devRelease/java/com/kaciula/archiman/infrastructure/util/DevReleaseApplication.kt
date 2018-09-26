package com.kaciula.archiman.infrastructure.util

import com.kaciula.archiman.domain.boundary.CrashReporter
import com.kaciula.archiman.domain.util.Timberific
import com.kaciula.archiman.presentation.util.DevDrawer
import org.koin.android.ext.android.inject
import org.koin.log.EmptyLogger
import org.koin.log.Logger

class DevReleaseApplication : BaseApplication() {

    private val crashReporter: CrashReporter by inject()

    override fun onSetup() {
        Timberific.init(true)
        DevDrawer.setupLogging(this)

        val uncaughtExceptionHandler = RestartUncaughtExceptionHandler(this)
        Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler)

        // FIXME: Uncomment this when set up fabric key
//        crashReporter.init()
    }

    override fun koinLogger(): Logger = EmptyLogger()
}
