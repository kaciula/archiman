package com.kaciula.archiman.infrastructure

import android.provider.Settings

object AndroidUtils {

    fun getDeviceId(): String {
        val ctx = BaseApplication.getContext()
        val deviceId = Settings.Secure.getString(ctx.contentResolver, Settings.Secure.ANDROID_ID)
        if (!deviceId.isBlank()) {
            return deviceId
        }
        return "THISISASTATICID"
    }

    fun getInstaller(): String {
        val ctx = BaseApplication.getContext()
        val installer = ctx.packageManager.getInstallerPackageName(ctx.packageName)
        if ("com.android.vending" == installer || "com.google.android.feedback" == installer) {
            return "Google Play Store"
        }
        if ("com.amazon.venezia" == installer) {
            return "Amazon App Store"
        }
        if (installer == null) {
            return "No store info"
        }
        return installer
    }
}
