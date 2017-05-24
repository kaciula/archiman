package com.kaciula.archiman.domain.usecase;


import static org.mockito.Mockito.when;

import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.repository.UsersRepository;
import com.kaciula.archiman.util.scheduler.TrampolineSchedulerProvider;
import io.reactivex.Observable;
import io.reactivex.observers.TestObserver;
import java.util.ArrayList;
import java.util.List;
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

    TestObserver<GetUsers.ResponseModel> observer =
        useCase.execute(GetUsers.RequestModel.create()).test();
    observer.assertValues(GetUsers.ResponseModel.IN_FLIGHT, GetUsers.ResponseModel.success(users));
  }

  @Test
  public void getUsersFailure() {
    Throwable error = new Throwable();
    when(usersRepository.getUsers()).thenReturn(Observable.error(error));

    TestObserver<GetUsers.ResponseModel> observer =
        useCase.execute(GetUsers.RequestModel.create()).test();
    observer.assertValues(GetUsers.ResponseModel.IN_FLIGHT, GetUsers.ResponseModel.error(error));
  }
}
