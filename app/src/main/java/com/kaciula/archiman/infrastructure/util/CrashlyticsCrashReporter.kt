package com.kaciula.archiman.infrastructure.util

import android.content.Context
import com.crashlytics.android.Crashlytics
import com.kaciula.archiman.boundary.CrashReporter
import io.fabric.sdk.android.Fabric
import timber.log.Timber

class CrashlyticsCrashReporter(private val context: Context) :
    CrashReporter {

    override fun init() {
        Fabric.with(context, Crashlytics())
        Crashlytics.setUserIdentifier(AndroidUtils.getDeviceId(context))
        Crashlytics.setString("Installer", AndroidUtils.getInstaller(context))
        Timber.plant(CrashlyticsTree())
    }
}

