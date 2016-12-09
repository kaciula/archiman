package com.kaciula.archiman.data.remote;

import com.kaciula.archiman.data.remote.response.UsersResponse;

import io.reactivex.Observable;
import retrofit2.http.GET;

public interface StackExchangeApi {

    @GET("users?site=stackoverflow")
    Observable<UsersResponse> getUsers();
}
