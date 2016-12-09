package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.model.User;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.Observable;

public class FakeUsersDataSource implements UsersDataSource {

    @Override
    public Observable<List<User>> getUsers() {
        List<User> users = new ArrayList<>(6);
        users.add(User.create("ka"));
        users.add(User.create("andrei"));
        users.add(User.create("arti"));
        users.add(User.create("marius"));
        users.add(User.create("stefan"));
        users.add(User.create("bogdan"));
        return Observable.just(users);
    }
}
