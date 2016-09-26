package com.kaciula.archiman.data.remote.mapper;

import com.kaciula.archiman.domain.model.User;
import com.kaciula.archiman.data.remote.response.UserResponse;

import java.util.ArrayList;
import java.util.List;

import rx.functions.Func1;

public class UserResponseListMapper implements Func1<List<UserResponse>, List<User>> {

    private static volatile UserResponseListMapper instance;

    private UserResponseListMapper() {
    }

    public static UserResponseListMapper instance() {
        if (instance == null)
            instance = new UserResponseListMapper();
        return instance;
    }

    @Override
    public List<User> call(List<UserResponse> userResponseList) {
        List<User> users = new ArrayList<>(userResponseList.size());
        for (UserResponse userResponse : userResponseList) {
            users.add(User.create(userResponse.login));
        }
        return users;
    }
}
