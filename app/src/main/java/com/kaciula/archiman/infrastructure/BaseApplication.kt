package com.kaciula.archiman.infrastructure

import android.annotation.SuppressLint
import android.app.Application
import android.content.Context
import android.os.StrictMode
import edu.umd.cs.findbugs.annotations.SuppressWarnings
import net.danlew.android.joda.JodaTimeAndroid

abstract class BaseApplication : Application() {

    @SuppressWarnings("ST")
    override fun onCreate() {
        super.onCreate()

        BaseApplication.context = applicationContext
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

    companion object {

        /* Get the context when you don't have access to it in any other way */
        @SuppressLint("StaticFieldLeak") lateinit var context: Context
            private set
    }
}
