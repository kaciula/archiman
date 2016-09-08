package com.kaciula.archiman.data.remote;

import com.kaciula.archiman.data.UsersDataSource;
import com.kaciula.archiman.data.model.User;
import com.kaciula.archiman.data.remote.converter.UserResponseListConverter;

import java.util.List;

import rx.Observable;

public class UsersRemoteDataSource implements UsersDataSource {

    private GithubApi githubApi;

    public UsersRemoteDataSource(GithubApi githubApi) {
        this.githubApi = githubApi;
    }

    @Override
    public Observable<List<User>> getMembersOfOrganisation(String organisationName) {
        return githubApi.getMembers(organisationName).map(UserResponseListConverter.instance());
    }
}
