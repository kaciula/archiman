package com.kaciula.archiman.presentation.screen.main;


import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.usecase.GetUsers;
import com.kaciula.archiman.presentation.screen.home.HomeContract;
import com.kaciula.archiman.presentation.screen.home.HomePresenter;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import com.kaciula.archiman.util.scheduler.TrampolineSchedulerProvider;
import io.reactivex.Observable;
import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class HomePresenterTest {

  @Mock HomeContract.Container container;
  @Mock HomeContract.View view;
  @Mock GetUsers getUsers;

  private HomePresenter presenter;

  @Before
  public void setupPresenter() {
    MockitoAnnotations.initMocks(this);

    BaseSchedulerProvider schedulerProvider = new TrampolineSchedulerProvider();
    presenter = new HomePresenter(container, view, schedulerProvider, getUsers);
  }

  @Test
  public void startCallSetup() {
    when(getUsers.execute(GetUsers.RequestModel.create()))
        .thenReturn(Observable.<GetUsers.ResponseModel>empty());

    presenter.start();

    verify(view).setup();
  }

  @Test
  public void loadUsersCallViewToShowContent() {
    List<User> users = new ArrayList<>();
    users.add(User.create("Bob Sacamano"));
    when(getUsers.execute(GetUsers.RequestModel.create()))
        .thenReturn(Observable.just(GetUsers.ResponseModel.create(users)));

    presenter.start();

    verify(view).showProgress();
    verify(view).showContent();
  }

  @Test
  public void loadUsersErrorCallViewToShowError() {
    when(getUsers.execute(GetUsers.RequestModel.create()))
        .thenReturn(Observable.<GetUsers.ResponseModel>error(new Exception()));

    presenter.start();

    verify(view).showProgress();
    verify(view).showError();
  }
}
