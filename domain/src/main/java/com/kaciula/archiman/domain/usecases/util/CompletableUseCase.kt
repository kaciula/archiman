package com.kaciula.archiman.domain.usecases.util

import io.reactivex.Completable

abstract class CompletableUseCase<in Q> {

    abstract fun execute(requestModel: Q): Completable
}
