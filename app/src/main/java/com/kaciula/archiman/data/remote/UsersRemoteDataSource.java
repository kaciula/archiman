package com.kaciula.archiman.data.remote;

import com.kaciula.archiman.data.UsersDataSource;
import com.kaciula.archiman.data.remote.response.UserResponse;
import com.kaciula.archiman.domain.model.User;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.Observable;
import io.reactivex.functions.Function;

public class UsersRemoteDataSource implements UsersDataSource {

    private GithubApi githubApi;

    public UsersRemoteDataSource(GithubApi githubApi) {
        this.githubApi = githubApi;
    }

    @Override
    public Observable<List<User>> getMembersOfOrganisation(String organisationName) {
        return githubApi.getMembers(organisationName)
                .map(new Function<List<UserResponse>, List<User>>() {
                    @Override
                    public List<User> apply(List<UserResponse> userResponses) throws Exception {
                        List<User> users = new ArrayList<>(userResponses.size());
                        for (UserResponse userResponse : userResponses) {
                            users.add(User.create(userResponse.login()));
                        }
                        return users;
                    }
                });
    }
}
