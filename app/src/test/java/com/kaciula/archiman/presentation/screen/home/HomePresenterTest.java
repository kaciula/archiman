package com.kaciula.archiman.presentation.screen.home;


import com.kaciula.archiman.domain.boundary.SchedulerProvider;
import com.kaciula.archiman.domain.usecases.GetUsers;
import com.kaciula.archiman.infrastructure.scheduler.TrampolineSchedulerProvider;
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

    SchedulerProvider schedulerProvider = new TrampolineSchedulerProvider();
    presenter = new HomePresenter(view, schedulerProvider, getUsers);
  }
}
