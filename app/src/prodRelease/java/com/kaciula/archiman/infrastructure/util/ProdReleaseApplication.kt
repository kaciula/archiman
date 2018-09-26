package com.kaciula.archiman.infrastructure.util

import com.kaciula.archiman.domain.boundary.CrashReporter
import org.koin.android.ext.android.inject
import org.koin.log.EmptyLogger
import org.koin.log.Logger

class ProdReleaseApplication : BaseApplication() {

    private val crashReporter: CrashReporter by inject()

    override fun onSetup() {
        val uncaughtExceptionHandler = RestartUncaughtExceptionHandler(this)
        Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler)

        // FIXME: Uncomment this when set up fabric key
//        crashReporter.init()
    }

    override fun koinLogger(): Logger = EmptyLogger()
}
