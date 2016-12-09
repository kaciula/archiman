package com.kaciula.archiman.data.remote.mapper;

import com.kaciula.archiman.data.remote.response.UserResponse;
import com.kaciula.archiman.data.remote.response.UsersResponse;
import com.kaciula.archiman.domain.model.User;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.functions.Function;

public class UsersResponseMapper implements Function<UsersResponse, List<User>> {

    @Override
    public List<User> apply(UsersResponse usersResponse) throws Exception {
        List<User> users = new ArrayList<>(usersResponse.items().size());
        for (UserResponse userResponse : usersResponse.items()) {
            users.add(User.create(userResponse.displayName()));
        }
        return users;
    }
}
