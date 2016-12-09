package com.kaciula.archiman.data.remote;

import com.kaciula.archiman.data.UsersDataSource;
import com.kaciula.archiman.data.remote.mapper.UsersResponseMapper;
import com.kaciula.archiman.domain.model.User;

import java.util.List;

import io.reactivex.Observable;

public class UsersRemoteDataSource implements UsersDataSource {

    private StackExchangeApi stackExchangeApi;

    public UsersRemoteDataSource(StackExchangeApi stackExchangeApi) {
        this.stackExchangeApi = stackExchangeApi;
    }

    @Override
    public Observable<List<User>> getUsers() {
        return stackExchangeApi.getUsers()
                .map(new UsersResponseMapper());
    }
}
