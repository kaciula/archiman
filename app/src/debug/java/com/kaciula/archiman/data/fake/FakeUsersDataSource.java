package com.kaciula.archiman.data.fake;

import com.kaciula.archiman.data.UserDataSource;
import com.kaciula.archiman.domain.entity.User;
import io.reactivex.Completable;
import io.reactivex.Observable;
import java.util.ArrayList;
import java.util.List;

public class FakeUsersDataSource implements UserDataSource {

  @Override
  public Observable<List<User>> getUsers() {
    List<User> users = new ArrayList<>(6);
    users.add(User.create(1, "ka"));
    users.add(User.create(2, "andrei"));
    users.add(User.create(3, "arti"));
    users.add(User.create(4, "marius"));
    users.add(User.create(5, "stefan"));
    users.add(User.create(6, "bogdan"));
    return Observable.just(users);
  }

  @Override
  public Completable createOrUpdateUsers(List<User> users) {
    return Completable.fromAction(() -> {
      // Do nothing here
    });
  }
}
