package com.kaciula.archiman.infrastructure.util

import org.koin.log.Logger

class EmptyKoinLogger : Logger {

    override fun debug(msg: String) {
        // Do nothing
    }

    override fun err(msg: String) {
        // Do nothing
    }

    override fun log(msg: String) {
        // Do nothing
    }
}