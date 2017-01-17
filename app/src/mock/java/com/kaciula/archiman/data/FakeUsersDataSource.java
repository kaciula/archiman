package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.entity.User;
import io.reactivex.Completable;
import io.reactivex.Observable;
import io.reactivex.functions.Action;
import java.util.ArrayList;
import java.util.List;

public class FakeUsersDataSource implements UsersDataSource {

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
    return Completable.fromAction(new Action() {
      @Override
      public void run() throws Exception {
        // Do nothing here
      }
    });
  }
}
