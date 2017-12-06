package com.kaciula.archiman.infrastructure.data.remote

import com.kaciula.archiman.infrastructure.data.remote.response.UsersRemote
import io.reactivex.Single
import retrofit2.http.GET

interface StackExchangeApi {

    @GET("users?site=stackoverflow")
    fun getUsers(): Single<UsersRemote>
}
