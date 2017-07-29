package com.kaciula.archiman.domain.util

import java.util.logging.Level
import java.util.logging.Logger

object Timberific {

    private val logger: Logger = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME)

    fun d(message: String) {
        logger.log(Level.FINEST, message)
    }

    fun i(message: String) {
        logger.log(Level.INFO, message)
    }
}

