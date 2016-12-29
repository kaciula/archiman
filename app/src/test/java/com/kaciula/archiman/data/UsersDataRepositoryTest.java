package com.kaciula.archiman.data;


import static org.hamcrest.core.Is.is;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.kaciula.archiman.domain.model.User;
import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import java.util.ArrayList;
import java.util.List;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class UsersDataRepositoryTest {

  @Mock UsersDataSource usersDataSource;

  private UsersDataRepository usersRepository;

  @Before
  public void setupUseCase() {
    MockitoAnnotations.initMocks(this);

    usersRepository = new UsersDataRepository(usersDataSource);
  }

  @Test
  public void getUsers() {
    final List<User> users = new ArrayList<>();
    users.add(User.create("Best programmer"));
    users.add(User.create("Second best programmer"));
    when(usersDataSource.getUsers()).thenReturn(Observable.fromArray(users));

    usersRepository.getUsers()
        .subscribe(new Observer<List<User>>() {
                     @Override
                     public void onSubscribe(Disposable d) {
                       // do nothing
                     }

                     @Override
                     public void onNext(List<User> usersList) {
                       Assert.assertThat(usersList, is(users));
                     }

                     @Override
                     public void onError(Throwable e) {
                       Assert.fail("Failed to receive the users list");
                     }

                     @Override
                     public void onComplete() {
                       // do nothing
                     }
                   }
        );

    verify(usersDataSource).getUsers();
  }
}
