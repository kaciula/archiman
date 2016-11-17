package com.kaciula.archiman.data.remote.mapper;

import com.kaciula.archiman.data.remote.response.UserResponse;
import com.kaciula.archiman.domain.model.User;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.functions.Function;

public class UsersResponseMapper implements Function<List<UserResponse>, List<User>> {

    @Override
    public List<User> apply(List<UserResponse> userResponses) throws Exception {
        List<User> users = new ArrayList<>(userResponses.size());
        for (UserResponse userResponse : userResponses) {
            users.add(User.create(userResponse.login()));
        }
        return users;
    }
}
