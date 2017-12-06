package com.kaciula.archiman.domain.usecases

import com.kaciula.archiman.domain.boundary.data.UserRepository
import com.kaciula.archiman.domain.entity.User
import com.kaciula.archiman.domain.util.ObservableUseCase
import io.reactivex.Observable

class GetUsers(private val userRepository: UserRepository)
    : ObservableUseCase<GetUsers.RequestModel, GetUsers.ResponseModel>() {

    override fun execute(requestModel: RequestModel): Observable<ResponseModel> {
        return userRepository.getUsers()
                .map { users -> ResponseModel(users) }
    }

    object RequestModel

    data class ResponseModel(val users: List<User>)
}
