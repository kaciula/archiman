package com.kaciula.archiman.presentation.screen.main;


import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.kaciula.archiman.data.UsersRepository;
import com.kaciula.archiman.domain.model.User;
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
  @Mock UsersRepository usersRepository;

  private MainPresenter presenter;

  @Before
  public void setupPresenter() {
    MockitoAnnotations.initMocks(this);

    BaseSchedulerProvider schedulerProvider = new TrampolineSchedulerProvider();
    presenter = new MainPresenter(container, view, schedulerProvider, usersRepository);
  }

  @Test
  public void startCallSetup() {
    when(usersRepository.getUsers()).thenReturn(Observable.<List<User>>empty());

    presenter.start();

    verify(view).setup();
  }

  @Test
  public void loadUsersCallViewToShowContent() {
    List<User> users = new ArrayList<>();
    users.add(User.create("Bob Sacamano"));
    when(usersRepository.getUsers()).thenReturn(Observable.just(users));

    presenter.start();

    verify(view).showProgress();
    verify(view).showContent();
  }

  @Test
  public void loadUsersErrorCallViewToShowError() {
    when(usersRepository.getUsers()).thenReturn(Observable.<List<User>>error(new Exception()));

    presenter.start();

    verify(view).showProgress();
    verify(view).showError();
  }
}
