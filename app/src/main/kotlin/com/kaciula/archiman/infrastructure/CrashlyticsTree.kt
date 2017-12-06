package com.kaciula.archiman.infrastructure

import android.util.Log
import com.crashlytics.android.Crashlytics
import timber.log.Timber

class CrashlyticsTree : Timber.Tree() {

    override fun log(priority: Int, tag: String, message: String, t: Throwable?) {
        if (priority == Log.VERBOSE || priority == Log.DEBUG) {
            return
        }

        Crashlytics.log(message)

        if (t != null && priority == Log.ERROR) {
            Crashlytics.logException(t)
        }
    }
}