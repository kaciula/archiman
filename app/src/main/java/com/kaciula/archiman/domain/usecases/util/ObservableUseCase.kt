package com.kaciula.archiman.domain.usecases.util

import io.reactivex.Observable

abstract class ObservableUseCase<in Q, P> {

    abstract fun execute(requestModel: Q): Observable<P>
}
