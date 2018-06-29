package com.kaciula.archiman.infrastructure.log

import android.util.Log

class LogEntry(val level: Int, val tag: String, val message: String, val timeStamp: String) {

    fun prettyPrint(): String {
        return String.format("%18s %18s %s %s", timeStamp, tag, displayLevel(), message)
    }

    fun displayLevel(): String {
        when (level) {
            Log.VERBOSE -> return "V"
            Log.DEBUG -> return "D"
            Log.INFO -> return "I"
            Log.WARN -> return "W"
            Log.ERROR -> return "E"
            Log.ASSERT -> return "A"
            else -> return "?"
        }
    }
}