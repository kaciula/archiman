package com.kaciula.archiman.domain.usecase;


import static org.hamcrest.core.Is.is;
import static org.mockito.Mockito.when;

import com.kaciula.archiman.domain.abstractions.UsersRepository;
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

public class GetUsersUseCaseTest {

  @Mock UsersRepository usersRepository;

  private GetUsersUseCase useCase;

  @Before
  public void setupUseCase() {
    MockitoAnnotations.initMocks(this);

    useCase = new GetUsersUseCase(usersRepository);
  }

  @Test
  public void getUsers() {
    final List<User> users = new ArrayList<>();
    users.add(User.create("Best programmer"));
    users.add(User.create("Second best programmer"));
    when(usersRepository.getUsers()).thenReturn(Observable.fromArray(users));

    useCase.execute(GetUsersUseCase.RequestValues.create())
        .subscribe(new Observer<GetUsersUseCase.ResponseValue>() {
                     @Override
                     public void onSubscribe(Disposable d) {
                       // do nothing
                     }

                     @Override
                     public void onNext(GetUsersUseCase.ResponseValue value) {
                       Assert.assertThat(value.users(), is(users));
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
  }
}
