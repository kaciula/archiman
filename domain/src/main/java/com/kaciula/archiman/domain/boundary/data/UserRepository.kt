package com.kaciula.archiman.domain.boundary.data

import com.kaciula.archiman.domain.entity.User
import io.reactivex.Observable

interface UserRepository {
    fun getUsers(): Observable<List<User>>
}
