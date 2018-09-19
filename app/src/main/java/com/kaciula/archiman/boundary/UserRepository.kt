package com.kaciula.archiman.boundary

import io.reactivex.Single

interface UserRepository {

    fun getAll(): Single<List<User>>
}

data class User(val accountId: Long, val name: String)