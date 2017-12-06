package com.kaciula.archiman.domain.boundary.infrastructure

import com.kaciula.archiman.domain.model.User
import io.reactivex.Single

interface UserRepository {
    fun getAll(): Single<List<User>>
}
