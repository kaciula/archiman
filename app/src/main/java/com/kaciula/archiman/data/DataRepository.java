package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.model.User;

import java.util.List;

import io.reactivex.Observable;

public class DataRepository implements UsersDataSource {

    private UsersDataSource usersRemoteDataSource;

    public DataRepository(UsersDataSource usersRemoteDataSource) {
        this.usersRemoteDataSource = usersRemoteDataSource;
    }

    @Override
    public Observable<List<User>> getUsers() {
        return usersRemoteDataSource.getUsers();
    }
}
