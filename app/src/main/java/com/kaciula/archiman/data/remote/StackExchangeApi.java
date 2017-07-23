package com.kaciula.archiman.data.remote;

import com.kaciula.archiman.data.remote.response.UsersRemote;
import io.reactivex.Observable;
import retrofit2.http.GET;

public interface StackExchangeApi {

  @GET("users?site=stackoverflow")
  Observable<UsersRemote> getUsers();
}
