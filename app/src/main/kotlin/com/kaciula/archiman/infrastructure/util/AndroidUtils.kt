package com.kaciula.archiman.infrastructure.util

import android.content.Context
import android.provider.Settings

object AndroidUtils {

    fun getDeviceId(context: Context): String {
        val deviceId = Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID)
        return if (!deviceId.isBlank()) deviceId else "THISISASTATICID"
    }

    fun getInstaller(context: Context): String {
        val installer = context.packageManager.getInstallerPackageName(context.packageName)
        if ("com.android.vending" == installer || "com.google.android.feedback" == installer) {
            return "Google Play Store"
        }
        if ("com.amazon.venezia" == installer) {
            return "Amazon App Store"
        }
        return installer ?: "No store info"
    }
}
