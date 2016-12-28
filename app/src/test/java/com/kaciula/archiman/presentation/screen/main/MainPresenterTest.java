package com.kaciula.archiman.presentation.screen.main;


import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.kaciula.archiman.domain.model.User;
import com.kaciula.archiman.domain.usecase.GetUsersUseCase;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import com.kaciula.archiman.util.scheduler.TrampolineSchedulerProvider;
import io.reactivex.Observable;
import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class MainPresenterTest {

  @Mock MainContract.Container container;
  @Mock MainContract.View view;
  @Mock GetUsersUseCase getUsersUseCase;

  private MainPresenter presenter;

  @Before
  public void setupPresenter() {
    MockitoAnnotations.initMocks(this);

    BaseSchedulerProvider schedulerProvider = new TrampolineSchedulerProvider();
    presenter = new MainPresenter(container, view, schedulerProvider, getUsersUseCase);
  }

  @Test
  public void startCallSetup() {
    when(getUsersUseCase.execute(GetUsersUseCase.RequestValues.create()))
        .thenReturn(Observable.<GetUsersUseCase.ResponseValue>empty());

    presenter.start();

    verify(view).setup();
  }

  @Test
  public void loadUsersCallViewToShowContent() {
    List<User> users = new ArrayList<>();
    users.add(User.create("Bob Sacamano"));
    when(getUsersUseCase.execute(GetUsersUseCase.RequestValues.create()))
        .thenReturn(Observable.just(GetUsersUseCase.ResponseValue.create(users)));

    presenter.start();

    verify(view).showProgress();
    verify(view).showContent();
  }

  @Test
  public void loadUsersErrorCallViewToShowError() {
    when(getUsersUseCase.execute(GetUsersUseCase.RequestValues.create()))
        .thenReturn(Observable.<GetUsersUseCase.ResponseValue>error(new Exception()));

    presenter.start();

    verify(view).showProgress();
    verify(view).showError();
  }
}
