package com.kaciula.archiman.infrastructure.util

import com.facebook.stetho.Stetho
import com.facebook.stetho.timber.StethoTree
import com.kaciula.archiman.presentation.util.DevDrawer
import com.squareup.leakcanary.LeakCanary
import jp.wasabeef.takt.Takt
import org.koin.android.logger.AndroidLogger
import org.koin.log.Logger
import timber.log.Timber

class DevDebugApplication : BaseApplication() {

    override fun onSetup() {
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

    override fun koinLogger(): Logger = AndroidLogger()

    override fun onTerminate() {
        Takt.finish()
        super.onTerminate()
    }
}
