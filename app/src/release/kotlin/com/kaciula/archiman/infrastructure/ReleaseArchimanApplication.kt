package com.kaciula.archiman.infrastructure

import com.kaciula.archiman.infrastructure.util.ArchimanApplication
import com.kaciula.archiman.infrastructure.util.ArchimanUncaughtExceptionHandler

class ReleaseArchimanApplication : ArchimanApplication() {

    override fun onCreate() {
        super.onCreate()

        val uncaughtExceptionHandler = ArchimanUncaughtExceptionHandler(this)
        Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler)

        crashReporter.init()
    }
}
