package com.kaciula.archiman.net;

import com.kaciula.archiman.net.response.UserResponse;

import java.util.List;

import retrofit.http.GET;
import retrofit.http.Path;
import rx.Observable;

public interface GithubApi {

    @GET("/orgs/{organisationName}/members")
    Observable<List<UserResponse>> getMembers(@Path("organisationName") String organisationName);
}
