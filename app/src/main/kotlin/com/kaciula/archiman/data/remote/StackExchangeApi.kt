package com.kaciula.archiman.data.remote

import com.kaciula.archiman.data.remote.response.UsersRemote
import io.reactivex.Observable
import retrofit2.http.GET

interface StackExchangeApi {

    @GET("users?site=stackoverflow")
    fun getUsers(): Observable<UsersRemote>
}
