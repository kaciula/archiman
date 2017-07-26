package com.kaciula.archiman.presentation.screen.userdetails;

import com.kaciula.archiman.domain.util.SchedulerProvider;
import com.kaciula.archiman.presentation.screen.home.UserViewModel;

class UserDetailsPresenter implements UserDetailsContract.Presenter {

  private final UserDetailsContract.View view;
  private final UserViewModel user;
  private final SchedulerProvider schedulerProvider;

  UserDetailsPresenter(UserDetailsContract.View view, UserViewModel user,
      SchedulerProvider schedulerProvider) {
    this.view = view;
    this.user = user;
    this.schedulerProvider = schedulerProvider;
  }

  @Override
  public void init() {
    view.render(UserDetailsViewModel.create(user.name()));
  }

  @Override
  public void start() {

  }

  @Override
  public void stop() {

  }

  @Override
  public void destroy() {

  }
}
