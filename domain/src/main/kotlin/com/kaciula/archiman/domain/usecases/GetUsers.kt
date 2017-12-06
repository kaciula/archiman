package com.kaciula.archiman.domain.usecases

import com.kaciula.archiman.domain.boundary.infrastructure.UserRepository
import com.kaciula.archiman.domain.model.User
import com.kaciula.archiman.domain.usecases.util.SingleUseCase
import io.reactivex.Single

class GetUsers(private val userRepository: UserRepository)
    : SingleUseCase<GetUsers.RequestModel, GetUsers.ResponseModel>() {

    override fun execute(requestModel: RequestModel): Single<ResponseModel> {
        return userRepository.getAll()
                .map { users -> ResponseModel(users) }
    }

    object RequestModel

    data class ResponseModel(val users: List<User>)
}
