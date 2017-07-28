package com.kaciula.archiman.domain.usecases

import com.kaciula.archiman.domain.boundary.data.UserRepository
import com.kaciula.archiman.domain.entity.User
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.domain.util.UseCase
import io.reactivex.Observable

class GetUsers(private val userRepository: UserRepository, private val schedulerProvider: SchedulerProvider)
    : UseCase<GetUsers.RequestModel, GetUsers.ResponseModel>() {

    override fun execute(requestModel: RequestModel): Observable<ResponseModel> {
        return userRepository.getUsers()
                .subscribeOn(schedulerProvider.io())
                .map { users -> ResponseModel.success(users) }
                .onErrorReturn { throwable -> ResponseModel.error(throwable) }
                .observeOn(schedulerProvider.ui())
                .startWith(ResponseModel.IN_FLIGHT)
    }

    class RequestModel : UseCase.RequestModel

    data class ResponseModel(val isInFlight: Boolean,
                             val isError: Boolean,
                             val error: Throwable?,
                             val isSuccess: Boolean,
                             val users: List<User>?) : UseCase.ResponseModel {

        companion object {

            val IN_FLIGHT = ResponseModel(true, false, null, false, null)

            fun error(throwable: Throwable): ResponseModel {
                return ResponseModel(false, true, throwable, false, null)
            }

            fun success(users: List<User>): ResponseModel {
                return ResponseModel(false, false, null, true, users)
            }
        }
    }
}
