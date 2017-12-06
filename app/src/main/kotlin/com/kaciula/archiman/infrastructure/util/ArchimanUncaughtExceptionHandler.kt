package com.kaciula.archiman.infrastructure.util

import android.content.Context
import android.content.Intent
import com.kaciula.archiman.presentation.screens.main.MainActivity

class ArchimanUncaughtExceptionHandler(private val context: Context) : Thread.UncaughtExceptionHandler {

    override fun uncaughtException(thread: Thread, ex: Throwable) {
        val startIntent = MainActivity.getStartIntent(context)
        startIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK)
        context.startActivity(startIntent)

        android.os.Process.killProcess(android.os.Process.myPid())
        System.exit(10)
    }
}
