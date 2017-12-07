package com.kaciula.archiman.domain.usecases

import com.kaciula.archiman.domain.boundary.infrastructure.AppRepository
import com.kaciula.archiman.domain.usecases.util.CompletableUseCase
import com.kaciula.archiman.domain.util.Timberific
import io.reactivex.Completable

class InitColdStart(private val appRepository: AppRepository) : CompletableUseCase<InitColdStart.RequestModel>() {

    override fun execute(requestModel: RequestModel): Completable {
        return Completable.fromAction {
            Timberific.i("Initialize every cold start")
            val currentVersionCode = requestModel.currentVersionCode
            val app = appRepository.get()
            if (app.isFirstTime) {
                Timberific.i("First time running the app")
                app.isFirstTime = false
                app.versionCode = currentVersionCode
            } else {
                if (app.versionCode < currentVersionCode) {
                    Timberific.i("Old version code ${app.versionCode} is replaced with new version code $currentVersionCode")
                    app.versionCode = currentVersionCode
                } else {
                    Timberific.i("Just a basic cold start")
                }
            }
            appRepository.save(app)
        }
    }

    data class RequestModel(val currentVersionCode: Int)
}
