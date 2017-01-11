package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.repository.UsersRepository;
import io.reactivex.Observable;
import java.util.List;

public class UsersDataRepository implements UsersRepository {

  private UsersDataSource usersRemoteDataSource;

  public UsersDataRepository(UsersDataSource usersRemoteDataSource) {
    this.usersRemoteDataSource = usersRemoteDataSource;
  }

  @Override
  public Observable<List<User>> getUsers() {
    return usersRemoteDataSource.getUsers();
  }
}
