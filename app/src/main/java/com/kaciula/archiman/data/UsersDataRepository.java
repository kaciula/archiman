package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.repository.UsersRepository;
import io.reactivex.Observable;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Predicate;
import java.util.ArrayList;
import java.util.List;
import org.joda.time.LocalDateTime;
import timber.log.Timber;

public class UsersDataRepository implements UsersRepository {

  private final UsersDataSource usersRemoteDataSource;
  private final UsersDataSource usersLocalDataSource;

  private LocalDateTime lastTimeUsedRemote;

  public UsersDataRepository(UsersDataSource usersRemoteDataSource,
      UsersDataSource usersLocalDataSource) {
    this.usersRemoteDataSource = usersRemoteDataSource;
    this.usersLocalDataSource = usersLocalDataSource;
    lastTimeUsedRemote = new LocalDateTime().minusMonths(1);
  }

  @Override
  public Observable<List<User>> getUsers() {
    Observable<List<User>> remote = usersRemoteDataSource.getUsers();
    Observable<List<User>> remoteWithSave = remote.doOnNext(new Consumer<List<User>>() {
      @Override
      public void accept(List<User> users) throws Exception {
        Timber.d("Remote called");
        lastTimeUsedRemote = new LocalDateTime();
        usersLocalDataSource.createOrUpdateUsers(users).blockingAwait();
      }
    });
    Observable<List<User>> local = usersLocalDataSource.getUsers()
        .filter(new Predicate<List<User>>() {
          @Override
          public boolean test(List<User> users) throws Exception {
            return new LocalDateTime().minusMinutes(1).isBefore(lastTimeUsedRemote);
          }
        })
        .doOnNext(new Consumer<List<User>>() {
          @Override
          public void accept(List<User> users) throws Exception {
            Timber.d("Local called");
          }
        });
    return Observable.concat(local, remoteWithSave).first(new ArrayList<User>()).toObservable();
  }
}
