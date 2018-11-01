package com.kaciula.archiman.presentation.util.mobius

import com.spotify.mobius.First
import com.spotify.mobius.MobiusLoop
import com.spotify.mobius.Next
import timber.log.Timber

data class InvocationTime<M, E, F>(val step: StepType<M, E, F>, val timeTaken: Long)

sealed class StepType<M, E, F>
data class Update<M, E, F>(val from: Pair<M, E>, val to: Either<Throwable, Next<M, F>>) :
    StepType<M, E, F>()

data class Init<M, E, F>(val from: M, val to: Either<Throwable, First<M, F>>) : StepType<M, E, F>()

sealed class Either<L, R>
data class Left<L, R>(val error: L) : Either<L, R>()
data class Right<L, R>(val value: R) : Either<L, R>()

class ProfilingLogger<M, E, F> : MobiusLoop.Logger<M, E, F> {
    private val updateMapping = mutableMapOf<Pair<M, E>, Long>()

    private var initTime = -1L
    private val trail = mutableListOf<InvocationTime<M, E, F>>()

    private inline fun time() = System.currentTimeMillis()

    override fun beforeInit(model: M) {
        initTime = time()
    }

    @Synchronized
    private fun add(pm: InvocationTime<M, E, F>) {
        trail.add(pm)
    }

    override fun afterInit(model: M, result: First<M, F>) {
        add(InvocationTime(Init(model, Right(result)), time() - initTime))
    }

    override fun exceptionDuringInit(model: M, exception: Throwable) {
        add(InvocationTime(Init(model, Left(exception)), time() - initTime))
    }

    override fun beforeUpdate(model: M, event: E) {
        updateMapping[model to event] = time()
    }

    override fun afterUpdate(model: M, event: E, result: Next<M, F>) {
        val from = model to event
        add(InvocationTime(Update(from, Right(result)), time() - updateMapping[from]!!))
    }

    override fun exceptionDuringUpdate(model: M, event: E, exception: Throwable) {
        val from = model to event
        add(InvocationTime(Update(from, Left(exception)), time() - updateMapping[from]!!))
    }

    @Synchronized
    fun inspectPerformance() = trail.toList()

    fun printPerformance() {
        val list = inspectPerformance()
        Timber.d("Performance:")
        for (time in list) {
            Timber.d("time taken = ${time.timeTaken} ms || Step = ${time.step}")
        }
    }
}