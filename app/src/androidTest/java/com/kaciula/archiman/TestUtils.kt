package com.kaciula.archiman


import android.app.Activity
import android.content.pm.ActivityInfo
import android.content.res.Configuration
import android.support.test.InstrumentationRegistry.getInstrumentation
import org.joda.time.DateTimeConstants

object TestUtils {

    fun rotateToLandscape(activity: Activity) {
        activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE
        getInstrumentation().waitForIdleSync()
        try {
            Thread.sleep((3 * DateTimeConstants.MILLIS_PER_SECOND).toLong())
        } catch (ignored: InterruptedException) {
        }

    }

    fun rotateToPortrait(activity: Activity) {
        activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
        getInstrumentation().waitForIdleSync()
        try {
            Thread.sleep((3 * DateTimeConstants.MILLIS_PER_SECOND).toLong())
        } catch (ignored: InterruptedException) {
        }

    }

    fun rotateOrientation(activity: Activity) {
        val currentOrientation = activity.resources.configuration.orientation

        when (currentOrientation) {
            Configuration.ORIENTATION_LANDSCAPE -> rotateToPortrait(activity)
            Configuration.ORIENTATION_PORTRAIT -> rotateToLandscape(activity)
            else -> rotateToLandscape(activity)
        }
    }
}
