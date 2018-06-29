package com.kaciula.archiman.infrastructure.data.remote

import com.kaciula.archiman.domain.model.User
import com.kaciula.archiman.infrastructure.data.UserDataStore
import com.kaciula.archiman.infrastructure.data.remote.mapper.UsersRemoteMapper
import io.reactivex.Completable
import io.reactivex.Single

class UserRemoteDataStore(private val stackExchangeApi: StackExchangeApi) : UserDataStore {

    override fun getUsers(): Single<List<User>> {
        return stackExchangeApi.getUsers().map(UsersRemoteMapper())
    }

    override fun createOrUpdateUsers(users: List<User>): Completable {
        return Completable.fromAction {
            // Do nothing because we do not need this implementation
        }
    }
}
