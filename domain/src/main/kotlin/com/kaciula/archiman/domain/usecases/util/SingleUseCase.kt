package com.kaciula.archiman.domain.usecases.util

import io.reactivex.Single

abstract class SingleUseCase<in Q, P> {

    abstract fun execute(requestModel: Q): Single<P>
}
