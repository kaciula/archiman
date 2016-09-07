package com.kaciula.archiman.net;

import com.kaciula.archiman.net.response.UserResponse;

import java.util.List;

import retrofit2.http.GET;
import retrofit2.http.Path;
import rx.Observable;

public interface GithubApi {

    @GET("orgs/{organisationName}/members")
    Observable<List<UserResponse>> getMembers(@Path("organisationName") String organisationName);
}
