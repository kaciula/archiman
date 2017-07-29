package com.kaciula.archiman.infrastructure

class ReleaseArchimanApplication : ArchimanApplication() {

    override fun onCreate() {
        super.onCreate()

        val uncaughtExceptionHandler = ArchimanUncaughtExceptionHandler(BaseApplication.context)
        Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler)

        crashReporter.init()
    }
}
