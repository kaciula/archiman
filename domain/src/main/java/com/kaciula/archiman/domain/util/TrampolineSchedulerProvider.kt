package com.kaciula.archiman.domain.util

import io.reactivex.Scheduler
import io.reactivex.schedulers.Schedulers

/**
 * Implementation of the [SchedulerProvider] making all [Scheduler]s trampoline.
 */
class TrampolineSchedulerProvider : SchedulerProvider {

    override fun computation(): Scheduler {
        return Schedulers.trampoline()
    }

    override fun io(): Scheduler {
        return Schedulers.trampoline()
    }

    override fun ui(): Scheduler {
        return Schedulers.trampoline()
    }
}
