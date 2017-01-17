package com.kaciula.archiman.data.remote;

import com.kaciula.archiman.data.UsersDataSource;
import com.kaciula.archiman.data.remote.mapper.UsersResponseMapper;
import com.kaciula.archiman.domain.entity.User;
import io.reactivex.Completable;
import io.reactivex.Observable;
import io.reactivex.functions.Action;
import java.util.List;

public class UsersRemoteDataSource implements UsersDataSource {

  private StackExchangeApi stackExchangeApi;

  public UsersRemoteDataSource(StackExchangeApi stackExchangeApi) {
    this.stackExchangeApi = stackExchangeApi;
  }

  @Override
  public Observable<List<User>> getUsers() {
    return stackExchangeApi.getUsers().map(new UsersResponseMapper());
  }

  @Override
  public Completable createOrUpdateUsers(List<User> users) {
    return Completable.fromAction(new Action() {
      @Override
      public void run() throws Exception {
        // Do nothing because we do not need this implementation
      }
    });
  }
}
