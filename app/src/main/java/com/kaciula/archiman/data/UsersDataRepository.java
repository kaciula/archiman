package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.repository.UsersRepository;
import io.reactivex.Observable;
import io.reactivex.functions.Consumer;
import java.util.List;

public class UsersDataRepository implements UsersRepository {

  private final UsersDataSource usersRemoteDataSource;
  private final UsersDataSource usersLocalDataSource;

  public UsersDataRepository(UsersDataSource usersRemoteDataSource,
      UsersDataSource usersLocalDataSource) {
    this.usersRemoteDataSource = usersRemoteDataSource;
    this.usersLocalDataSource = usersLocalDataSource;
  }

  @Override
  public Observable<List<User>> getUsers() {
    return usersRemoteDataSource.getUsers()
        .doOnNext(new Consumer<List<User>>() {
          @Override
          public void accept(List<User> users) throws Exception {
            usersLocalDataSource.createOrUpdateUsers(users).blockingAwait();
          }
        });
  }
}
