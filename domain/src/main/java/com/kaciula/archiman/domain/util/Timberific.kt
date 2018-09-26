package com.kaciula.archiman.domain.util

import java.util.logging.Level
import java.util.logging.Logger

object Timberific {

    private var isEnabled: Boolean = false
    private var logger: Logger? = null

    fun init(isEnabled: Boolean) {
        Timberific.isEnabled = isEnabled
        if (isEnabled) logger = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME)
    }

    // On some devices, the FINEST level is not shown. Use INFO level instead.
    fun d(message: String) {
        if (isEnabled) logger?.log(Level.FINEST, message)
    }

    fun i(message: String) {
        if (isEnabled) logger?.log(Level.INFO, message)
    }
}
