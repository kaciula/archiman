package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.model.User;

import java.util.ArrayList;
import java.util.List;

import rx.Observable;

public class FakeUsersDataSource implements UsersDataSource {

    @Override
    public Observable<List<User>> getMembersOfOrganisation(String organisationName) {
        List<User> users = new ArrayList<>(6);
        User user = new User();
        user.username = "ka";
        users.add(user);
        user = new User();
        user.username = "andrei";
        users.add(user);
        user = new User();
        user.username = "arti";
        users.add(user);
        user = new User();
        user.username = "marius";
        users.add(user);
        user = new User();
        user.username = "stefan";
        users.add(user);
        user = new User();
        user.username = "bogdan";
        users.add(user);
        return Observable.just(users);
    }
}
