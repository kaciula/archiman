package com.kaciula.archiman.domain.usecases

import com.kaciula.archiman.domain.boundary.data.AppInfoRepository
import com.kaciula.archiman.domain.util.CompletableUseCase
import io.reactivex.Completable

class InitColdStart(private val appInfoRepository: AppInfoRepository) : CompletableUseCase<InitColdStart.RequestModel>() {

    override fun execute(requestModel: RequestModel): Completable {
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
        }
    }

    data class RequestModel(val currentVersionCode: Int)
}
