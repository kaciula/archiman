package com.kaciula.archiman.presentation.screen.home;


import com.kaciula.archiman.domain.usecase.GetUsers;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import com.kaciula.archiman.util.scheduler.TrampolineSchedulerProvider;
import org.junit.Before;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class HomePresenterTest {

  @Mock HomeContract.View view;
  @Mock GetUsers getUsers;

  private HomePresenter presenter;

  @Before
  public void setupPresenter() {
    MockitoAnnotations.initMocks(this);

    BaseSchedulerProvider schedulerProvider = new TrampolineSchedulerProvider();
    presenter = new HomePresenter(view, schedulerProvider, getUsers);
  }
}
