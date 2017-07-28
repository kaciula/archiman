package com.kaciula.archiman.domain.usecases

import com.kaciula.archiman.domain.boundary.data.UserRepository
import com.kaciula.archiman.domain.entity.User
import com.kaciula.archiman.domain.util.ObservableUseCase
import com.kaciula.archiman.domain.util.SchedulerProvider
import io.reactivex.Observable

class GetUsers(private val userRepository: UserRepository, private val schedulerProvider: SchedulerProvider)
    : ObservableUseCase<GetUsers.RequestModel, GetUsers.ResponseModel>() {

    override fun execute(requestModel: RequestModel): Observable<ResponseModel> {
        return userRepository.getUsers()
                .subscribeOn(schedulerProvider.io())
                .map { users -> ResponseModel(isSuccess = true, users = users) }
                .onErrorReturn { throwable -> ResponseModel(isError = true, error = throwable) }
                .observeOn(schedulerProvider.ui())
                .startWith(ResponseModel(isInFlight = true))
    }

    class RequestModel

    data class ResponseModel(val isInFlight: Boolean = false,
                             val isError: Boolean = false,
                             val error: Throwable? = null,
                             val isSuccess: Boolean = false,
                             val users: List<User>? = null)
}
