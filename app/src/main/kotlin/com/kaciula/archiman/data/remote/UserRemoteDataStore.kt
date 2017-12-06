package com.kaciula.archiman.data.remote

import com.kaciula.archiman.data.UserDataStore
import com.kaciula.archiman.data.remote.mapper.UsersRemoteMapper
import com.kaciula.archiman.domain.entity.User
import io.reactivex.Completable
import io.reactivex.Observable

class UserRemoteDataStore(private val stackExchangeApi: StackExchangeApi) : UserDataStore {

    override fun getUsers(): Observable<List<User>> {
        return stackExchangeApi.getUsers().map(UsersRemoteMapper())
    }

    override fun createOrUpdateUsers(users: List<User>): Completable {
        return Completable.fromAction {
            // Do nothing because we do not need this implementation
        }
    }
}
