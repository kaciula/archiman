package com.kaciula.archiman.domain.usecase;


import static org.hamcrest.core.Is.is;
import static org.mockito.Mockito.when;

import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.repository.UsersRepository;
import com.kaciula.archiman.util.scheduler.TrampolineSchedulerProvider;
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

public class GetUsersTest {

  @Mock UsersRepository usersRepository;

  private GetUsers useCase;

  @Before
  public void setupUseCase() {
    MockitoAnnotations.initMocks(this);

    useCase = new GetUsers(usersRepository, new TrampolineSchedulerProvider());
  }

  @Test
  public void getUsersSuccess() {
    final List<User> users = new ArrayList<>();
    users.add(User.create(1, "Best programmer"));
    users.add(User.create(2, "Second best programmer"));
    when(usersRepository.getUsers()).thenReturn(Observable.fromArray(users));

    useCase.execute(GetUsers.RequestModel.create())
        .subscribe(new Observer<GetUsers.ResponseModel>() {
                     @Override
                     public void onSubscribe(Disposable d) {
                       // do nothing
                     }

                     @Override
                     public void onNext(GetUsers.ResponseModel value) {
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

  @Test
  public void getUsersFailure() {
    when(usersRepository.getUsers()).thenReturn(Observable.<List<User>>error(new Throwable()));

    useCase.execute(GetUsers.RequestModel.create())
        .subscribe(new Observer<GetUsers.ResponseModel>() {
          @Override
          public void onSubscribe(Disposable d) {
            // do nothing
          }

          @Override
          public void onNext(GetUsers.ResponseModel value) {
            Assert.fail("Should not finish successfully");
          }

          @Override
          public void onError(Throwable e) {
          }

          @Override
          public void onComplete() {
            // do nothing
          }
        });
  }
}
