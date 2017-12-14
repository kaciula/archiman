package com.kaciula.archiman.infrastructure.util

class ReleaseArchimanApplication : ArchimanApplication() {

    override fun onCreate() {
        super.onCreate()

        /*val uncaughtExceptionHandler = ArchimanUncaughtExceptionHandler(this)
        Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler)*/

        crashReporter.init()
    }
}
