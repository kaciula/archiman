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
    users.add(new User(1, "ka"));
    users.add(new User(2, "andrei"));
    users.add(new User(3, "arti"));
    users.add(new User(4, "marius"));
    users.add(new User(5, "stefan"));
    users.add(new User(6, "bogdan"));
    return Observable.just(users);
  }

  @Override
  public Completable createOrUpdateUsers(List<User> users) {
    return Completable.fromAction(() -> {
      // Do nothing here
    });
  }
}
