package com.kaciula.archiman.data

import com.kaciula.archiman.domain.entity.User
import io.reactivex.Completable
import io.reactivex.Observable

interface UserDataSource {

    fun getUsers(): Observable<List<User>>

    fun createOrUpdateUsers(users: List<User>): Completable
}
