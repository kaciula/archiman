package com.kaciula.archiman.infrastructure

import android.app.Application
import android.os.StrictMode
import net.danlew.android.joda.JodaTimeAndroid

abstract class BaseApplication : Application() {

    override fun onCreate() {
        super.onCreate()

        JodaTimeAndroid.init(this)
    }

    /*
   * When in developer mode, we use StrictMode (if available) to detect accidental
   * disk/network access on the application's main thread
   */
    protected fun enableFullStrictMode() {
        StrictMode
                .setThreadPolicy(StrictMode.ThreadPolicy.Builder().detectAll().penaltyLog().build())
        StrictMode.setVmPolicy(StrictMode.VmPolicy.Builder().detectAll().penaltyLog().build())
    }

    protected fun enableFullStrictModePenaltyDeath() {
        StrictMode
                .setThreadPolicy(StrictMode.ThreadPolicy.Builder().detectAll().penaltyDeath().build())
        StrictMode.setVmPolicy(StrictMode.VmPolicy.Builder().detectAll().penaltyDeath().build())
    }

    protected fun allowThreadDiskReads() {
        StrictMode.allowThreadDiskReads()
    }

    protected fun allowThreadDiskWrites() {
        StrictMode.allowThreadDiskWrites()
    }
}
