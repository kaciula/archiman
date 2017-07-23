package com.kaciula.archiman.data.remote;

import com.kaciula.archiman.data.UserDataSource;
import com.kaciula.archiman.data.remote.mapper.UsersRemoteMapper;
import com.kaciula.archiman.domain.entity.User;
import io.reactivex.Completable;
import io.reactivex.Observable;
import java.util.List;

public class UserRemoteDataSource implements UserDataSource {

  private StackExchangeApi stackExchangeApi;

  public UserRemoteDataSource(StackExchangeApi stackExchangeApi) {
    this.stackExchangeApi = stackExchangeApi;
  }

  @Override
  public Observable<List<User>> getUsers() {
    return stackExchangeApi.getUsers().map(new UsersRemoteMapper());
  }

  @Override
  public Completable createOrUpdateUsers(List<User> users) {
    return Completable.fromAction(() -> {
      // Do nothing because we do not need this implementation
    });
  }
}
