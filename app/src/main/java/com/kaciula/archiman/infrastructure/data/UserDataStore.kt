package com.kaciula.archiman.infrastructure.data

import com.kaciula.archiman.domain.model.User
import io.reactivex.Completable
import io.reactivex.Single

interface UserDataStore {

    fun getUsers(): Single<List<User>>

    fun createOrUpdateUsers(users: List<User>): Completable
}
