package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.boundary.data.UserRepository;
import com.kaciula.archiman.domain.entity.User;
import io.reactivex.Observable;
import java.util.ArrayList;
import java.util.List;
import org.joda.time.LocalDateTime;
import timber.log.Timber;

public class UserRepositoryImpl implements UserRepository {

  private final UsersDataSource usersRemoteDataSource;
  private final UsersDataSource usersLocalDataSource;

  private LocalDateTime lastTimeUsedRemote;

  public UserRepositoryImpl(UsersDataSource usersRemoteDataSource,
      UsersDataSource usersLocalDataSource) {
    this.usersRemoteDataSource = usersRemoteDataSource;
    this.usersLocalDataSource = usersLocalDataSource;
    lastTimeUsedRemote = new LocalDateTime().minusMonths(1);
  }

  @Override
  public Observable<List<User>> getUsers() {
    Observable<List<User>> remote = usersRemoteDataSource.getUsers();
    Observable<List<User>> remoteWithSave = remote.doOnNext(users -> {
      Timber.d("Remote called");
      lastTimeUsedRemote = new LocalDateTime();
      usersLocalDataSource.createOrUpdateUsers(users).blockingAwait();
    });
    Observable<List<User>> local = usersLocalDataSource.getUsers()
        .filter(users -> new LocalDateTime().minusMinutes(1).isBefore(lastTimeUsedRemote))
        .doOnNext(users -> Timber.d("Local called"));
    return Observable.concat(local, remoteWithSave).first(new ArrayList<>()).toObservable();
  }
}
