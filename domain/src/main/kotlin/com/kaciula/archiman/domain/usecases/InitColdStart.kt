package com.kaciula.archiman.domain.usecases

import com.kaciula.archiman.domain.boundary.data.AppInfoRepository
import com.kaciula.archiman.domain.util.CompletableUseCase
import com.kaciula.archiman.domain.util.Timberific
import io.reactivex.Completable

class InitColdStart(private val appInfoRepository: AppInfoRepository) : CompletableUseCase<InitColdStart.RequestModel>() {

    override fun execute(requestModel: RequestModel): Completable {
        return Completable.fromAction {
            Timberific.i("Initialize every cold start")
            val currentVersionCode = requestModel.currentVersionCode
            if (appInfoRepository.isFirstTime()) {
                Timberific.i("First time running the app")
                appInfoRepository.saveFirstTime(false)
                appInfoRepository.saveVersionCode(currentVersionCode)
            } else {
                if (appInfoRepository.getVersionCode() < currentVersionCode) {
                    Timberific.i("Old version code ${appInfoRepository.getVersionCode()} is replaced with new version code $currentVersionCode")
                    appInfoRepository.saveVersionCode(currentVersionCode)
                } else {
                    Timberific.i("Just a basic cold start")
                }
            }
        }
    }

    data class RequestModel(val currentVersionCode: Int)
}
