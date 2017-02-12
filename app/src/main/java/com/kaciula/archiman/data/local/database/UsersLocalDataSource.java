package com.kaciula.archiman.data.local.database;

import com.kaciula.archiman.data.UsersDataSource;
import com.kaciula.archiman.domain.entity.User;
import io.reactivex.Completable;
import io.reactivex.Observable;
import io.realm.Realm;
import io.realm.RealmResults;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

public class UsersLocalDataSource implements UsersDataSource {

  @Override
  public Observable<List<User>> getUsers() {
    return Observable.fromCallable(new Callable<List<User>>() {
      @Override
      public List<User> call() throws Exception {
        Realm realm = Realm.getDefaultInstance();
        RealmResults<UserDb> results = realm.where(UserDb.class).findAll();

        List<User> users = new ArrayList<>(results.size());
        for (UserDb userDb : results) {
          User user = User.create(userDb.accountId, userDb.name);
          users.add(user);
        }
        realm.close();
        return users;
      }
    });
  }

  @Override
  public Completable createOrUpdateUsers(final List<User> users) {
    return Completable.fromAction(() -> {
      Realm realm = Realm.getDefaultInstance();
      realm.executeTransaction(realm1 -> {
        List<UserDb> usersDb = new ArrayList<>(users.size());
        for (User user : users) {
          UserDb userDb = new UserDb();
          userDb.accountId = user.accountId();
          userDb.name = user.name();
          usersDb.add(userDb);
        }
        realm1.copyToRealmOrUpdate(usersDb);
      });
      realm.close();
    });
  }
}
