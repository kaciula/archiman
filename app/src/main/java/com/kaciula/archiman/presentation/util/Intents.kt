package com.kaciula.archiman.presentation.util

import android.content.Context
import android.content.Intent
import android.widget.Toast
import com.kaciula.archiman.R

object Intents {
    /**
     * Attempt to launch the supplied [Intent]. Queries on-device packages before launching and
     * will display a simple message if none are available to handle it.
     */
    fun maybeStartActivity(context: Context, intent: Intent): Boolean {
        if (hasHandler(context, intent)) {
            context.startActivity(intent)
            return true
        } else {
            Toast.makeText(context, R.string.all_no_apps_for_intent, Toast.LENGTH_LONG).show()
            return false
        }
    }

    /**
     * Queries on-device packages for a handler for the supplied [Intent].
     */
    fun hasHandler(context: Context, intent: Intent): Boolean {
        val handlers = context.packageManager.queryIntentActivities(intent, 0)
        return !handlers.isEmpty()
    }
}