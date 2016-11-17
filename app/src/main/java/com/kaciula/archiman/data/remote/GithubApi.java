package com.kaciula.archiman.data.remote;

import com.kaciula.archiman.data.remote.response.UserResponse;

import java.util.List;

import io.reactivex.Observable;
import retrofit2.http.GET;
import retrofit2.http.Path;

public interface GithubApi {

    @GET("orgs/{organisationName}/members")
    Observable<List<UserResponse>> getMembers(@Path("organisationName") String organisationName);
}
