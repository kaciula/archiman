package com.kaciula.archiman.domain.boundary

import io.reactivex.Scheduler

/**
 * Allow providing different types of [Scheduler]s.
 */
interface SchedulerProvider {

    fun computation(): Scheduler

    fun io(): Scheduler

    fun ui(): Scheduler
}