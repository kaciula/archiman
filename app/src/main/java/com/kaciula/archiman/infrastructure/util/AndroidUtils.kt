package com.kaciula.archiman.infrastructure.util

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.net.Uri
import android.os.Build
import android.provider.Settings
import android.support.annotation.AttrRes
import android.support.annotation.ColorInt
import android.util.DisplayMetrics
import android.util.TypedValue
import android.view.View
import android.view.WindowManager
import android.view.inputmethod.InputMethodManager
import com.kaciula.archiman.presentation.screens.main.MainActivity

object AndroidUtils {

    fun getDeviceId(context: Context): String {
        val deviceId =
            Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID)
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

    fun webIntent(url: String): Intent {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        return intent
    }

    fun wazeIntent(latitude: Double, longitude: Double): Intent {
        val uri = "https://waze.com/ul?ll=$latitude,$longitude&navigate=yes"
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(uri))
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        return intent
    }

    fun googleMapsIntent(latitude: Double, longitude: Double): Intent {
        val uri = "google.navigation:q=$latitude,$longitude"
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(uri))
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        return intent
    }

    fun appInstalled(context: Context, packageName: String): Boolean {
        return launchIntent(context, packageName) != null
    }

    private fun launchIntent(context: Context, packageName: String): Intent? {
        return context.packageManager.getLaunchIntentForPackage(packageName)
    }

    fun dialIntent(phoneNumber: String): Intent {
        val uri = "tel:$phoneNumber"
        val intent = Intent(Intent.ACTION_DIAL, Uri.parse(uri))
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        return intent
    }

    @ColorInt
    fun color(activity: Activity, @AttrRes attrId: Int): Int {
        val typedValue = TypedValue()
        val resolved = activity.theme.resolveAttribute(attrId, typedValue, true)
        return if (resolved) {
            typedValue.data
        } else {
            Color.WHITE
        }
    }

    fun restartProcess(context: Context) {
        val startIntent = MainActivity.getStartIntent(context)
        startIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK)
        context.startActivity(startIntent)

        android.os.Process.killProcess(android.os.Process.myPid())
        System.exit(10)
    }

    fun hideSoftKeyboard(view: View) {
        val imm = view.context.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
        if (imm.isActive) {
            imm.hideSoftInputFromWindow(view.windowToken, 0)
        }
    }

    fun showSoftKeyboard(view: View) {
        val imm = view.context.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
        if (view.requestFocus()) {
            imm.showSoftInput(view, 0)
        }
    }

    fun getScreenDimensionsDp(context: Context): Pair<Int, Int> {
        val dimensions = getScreenDimensionsPixels(context)
        return pixelsToDp(dimensions.first, context).toInt() to pixelsToDp(
            dimensions.second,
            context
        ).toInt()
    }

    private fun getScreenDimensionsPixels(context: Context): Pair<Int, Int> {
        val windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        val metrics = DisplayMetrics()
        windowManager.defaultDisplay.getMetrics(metrics)
        return metrics.widthPixels to metrics.heightPixels
    }

    fun pixelsToDp(px: Int, context: Context): Float {
        val metrics = context.resources.displayMetrics
        return px / (metrics.densityDpi / 160f)
    }

    private fun dpToPixels(dp: Int, context: Context): Float {
        val metrics = context.resources.displayMetrics
        return dp * (metrics.densityDpi / 160f)
    }

    fun isAtLeastMarshmallow() = Build.VERSION.SDK_INT >= Build.VERSION_CODES.M
}
