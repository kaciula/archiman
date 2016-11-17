package com.kaciula.archiman.data.remote;

import com.kaciula.archiman.data.UsersDataSource;
import com.kaciula.archiman.data.remote.mapper.UsersResponseMapper;
import com.kaciula.archiman.domain.model.User;

import java.util.List;

import io.reactivex.Observable;

public class UsersRemoteDataSource implements UsersDataSource {

    private GithubApi githubApi;

    public UsersRemoteDataSource(GithubApi githubApi) {
        this.githubApi = githubApi;
    }

    @Override
    public Observable<List<User>> getMembersOfOrganisation(String organisationName) {
        return githubApi.getMembers(organisationName)
                .map(new UsersResponseMapper());
    }
}
