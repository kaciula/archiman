package com.kaciula.archiman.infrastructure.boundary

import android.content.Context
import com.crashlytics.android.Crashlytics
import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import com.kaciula.archiman.infrastructure.AndroidUtils
import com.kaciula.archiman.infrastructure.CrashlyticsTree
import io.fabric.sdk.android.Fabric
import timber.log.Timber

class CrashlyticsCrashReporter(private val context: Context) : CrashReporter {

    override fun init() {
        // FIXME: 10/01/17 When you have set the fabric API key, replace this with true
        if (false) {
            Fabric.with(context, Crashlytics())
            Crashlytics.setUserIdentifier(AndroidUtils.getDeviceId())
            Crashlytics.setString("Installer", AndroidUtils.getInstaller())
            Timber.plant(CrashlyticsTree())
        }
    }
}
