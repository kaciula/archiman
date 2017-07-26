package com.kaciula.archiman.domain.util

import io.reactivex.Observable

abstract class UseCase<in Q : UseCase.RequestModel, P : UseCase.ResponseModel> {

    abstract fun execute(requestModel: Q): Observable<P>

    interface RequestModel

    interface ResponseModel
}
