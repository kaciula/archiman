package com.kaciula.archiman.infrastructure

import com.facebook.stetho.Stetho
import com.facebook.stetho.timber.StethoTree
import com.kaciula.archiman.presentation.util.DevDrawer
import com.squareup.leakcanary.LeakCanary
import jp.wasabeef.takt.Takt
import timber.log.Timber

class DebugArchimanApplication : ArchimanApplication() {

    override fun onCreate() {
        super.onCreate()
        if (LeakCanary.isInAnalyzerProcess(this)) {
            return
        }

        Timber.plant(Timber.DebugTree())
        DevDrawer.setupLogging(this)
        LeakCanary.install(this)
        Takt.stock(this).play()
        Stetho.initializeWithDefaults(this)
        Timber.plant(StethoTree())
    }

    override fun onTerminate() {
        Takt.finish()
        super.onTerminate()
    }
}
