package com.kaciula.archiman.infrastructure

import com.crashlytics.android.Crashlytics
import io.fabric.sdk.android.Fabric
import timber.log.Timber

class ReleaseArchimanApplication : ArchimanApplication() {

    override fun onCreate() {
        super.onCreate()

        val uncaughtExceptionHandler = ArchimanUncaughtExceptionHandler(BaseApplication.context)
        Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler)

        if (isCrashlyticsUsed()) {
            startCrashlytics()
            Timber.plant(CrashlyticsTree())
        }
    }

    override fun isCrashlyticsUsed(): Boolean {
        // FIXME: 10/01/17 When you have set the fabric API key, replace this with true
        return false
    }

    private fun startCrashlytics() {
        Fabric.with(this, Crashlytics())
        Crashlytics.setUserIdentifier(AndroidUtils.getDeviceId())
        Crashlytics.setString("Installer", AndroidUtils.getInstaller())
    }
}
