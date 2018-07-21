package com.kaciula.archiman.infrastructure.util

import com.spotify.mobius.First
import com.spotify.mobius.MobiusLoop
import com.spotify.mobius.Next
import timber.log.Timber

class MobiusLogger<M, E, F>(
    private val loggingPrefix: String = "Mobius"
) : MobiusLoop.Logger<M, E, F> {

    override fun afterUpdate(model: M, event: E, result: Next<M, F>) {
        if (result.hasModel()) {
            Timber.d("$loggingPrefix Model updated: ${result.modelUnsafe()}")
        }

        for (effect in result.effects()) {
            Timber.d("$loggingPrefix Effect dispatched: $effect")
        }
    }

    override fun afterInit(model: M, result: First<M, F>) {
        Timber.d("$loggingPrefix Loop initialized, starting from model: ${result.model()}")

        for (effect in result.effects()) {
            Timber.d("$loggingPrefix Effect dispatched: $effect")
        }
    }

    override fun beforeInit(model: M) {
        Timber.d("$loggingPrefix Initializing loop")
    }

    override fun beforeUpdate(model: M, event: E) {
        Timber.d("$loggingPrefix Event received: $event")
    }

    override fun exceptionDuringInit(model: M, exception: Throwable) {
        Timber.w(exception, "FATAL ERROR: exception during initialization from model $model")
    }

    override fun exceptionDuringUpdate(model: M, event: E, exception: Throwable) {
        Timber.w(exception, "FATAL ERROR: exception updating model $model with event $event")
    }
}