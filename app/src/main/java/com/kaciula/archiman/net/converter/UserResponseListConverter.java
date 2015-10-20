package com.kaciula.archiman.net.converter;

import com.kaciula.archiman.model.User;
import com.kaciula.archiman.net.response.UserResponse;

import java.util.ArrayList;
import java.util.List;

import rx.functions.Func1;

public class UserResponseListConverter implements Func1<List<UserResponse>, List<User>> {

    private static volatile UserResponseListConverter instance;

    private UserResponseListConverter() {
    }

    public static UserResponseListConverter instance() {
        if (instance == null)
            instance = new UserResponseListConverter();
        return instance;
    }

    @Override
    public List<User> call(List<UserResponse> userResponseList) {
        List<User> users = new ArrayList<>(userResponseList.size());
        for (UserResponse userResponse : userResponseList) {
            User user = new User();
            user.username = userResponse.login;
            users.add(user);
        }
        return users;
    }
}
