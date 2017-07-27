package com.kaciula.archiman.domain.usecases

import com.kaciula.archiman.domain.boundary.data.AppInfoRepository
import com.kaciula.archiman.domain.util.UseCase
import io.reactivex.Completable
import io.reactivex.Observable

class InitColdStart(private val appInfoRepository: AppInfoRepository) :
        UseCase<InitColdStart.RequestModel, InitColdStart.ResponseModel>() {

    override fun execute(requestModel: RequestModel): Observable<ResponseModel> {
        return Completable.fromAction {
            val currentVersionCode = requestModel.currentVersionCode
            if (appInfoRepository.isFirstTime()) {
                appInfoRepository.saveFirstTime(false)
                appInfoRepository.saveVersionCode(currentVersionCode)
            } else {
                if (appInfoRepository.getVersionCode() < currentVersionCode) {
                    appInfoRepository.saveVersionCode(currentVersionCode)
                }
            }
        }.toObservable()
    }

    data class RequestModel(val currentVersionCode: Int) : UseCase.RequestModel

    class ResponseModel : UseCase.ResponseModel
}
