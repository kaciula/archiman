package com.kaciula.archiman.infrastructure

import io.reactivex.exceptions.UndeliverableException
import io.reactivex.functions.Consumer
import timber.log.Timber
import java.io.IOException

class RxGlobalErrorHandler : Consumer<Throwable> {

    @Throws(Exception::class)
    override fun accept(throwable: Throwable) {
        var e = throwable
        if (e is UndeliverableException) {
            e = throwable.cause!!
        }
        if (e is IOException) {
            // fine, irrelevant network problem or API that throws on cancellation
            return
        }
        if (e is InterruptedException) {
            // fine, some blocking code was interrupted by a dispose call
            return
        }
        if (e is NullPointerException || e is IllegalArgumentException) {
            // that's likely a bug in the application
            Thread.currentThread().uncaughtExceptionHandler.uncaughtException(Thread
                    .currentThread(), e)
            return
        }
        if (e is IllegalStateException) {
            // that's a bug in RxJava or in a custom operator
            Thread.currentThread().uncaughtExceptionHandler.uncaughtException(Thread
                    .currentThread(), e)
            return
        }
        Timber.w(e, "Undeliverable exception received, not sure what to do")
    }
}
