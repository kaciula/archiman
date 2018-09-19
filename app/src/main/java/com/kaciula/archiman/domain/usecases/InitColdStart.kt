package com.kaciula.archiman.domain.usecases

import com.kaciula.archiman.boundary.AppRepository
import com.kaciula.archiman.domain.usecases.util.CompletableUseCase
import io.reactivex.Completable
import timber.log.Timber

class InitColdStart(private val appRepository: AppRepository) :
    CompletableUseCase<InitColdStart.RequestModel>() {

    override fun execute(requestModel: RequestModel): Completable {
        return Completable.fromAction {
            Timber.i("Initialize every cold start")
            val currentVersionCode = requestModel.currentVersionCode
            val app = appRepository.get()
            if (app.shouldBumpVersion(currentVersionCode)) {
                app.bumpVersion(currentVersionCode)
                appRepository.save(app)
            } else {
                Timber.i("Just a basic cold start")
            }
        }
    }

    data class RequestModel(val currentVersionCode: Int)
}
