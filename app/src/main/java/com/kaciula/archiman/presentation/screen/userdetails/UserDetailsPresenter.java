package com.kaciula.archiman.presentation.screen.userdetails;

import com.kaciula.archiman.presentation.screen.home.UserViewModel;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;

class UserDetailsPresenter implements UserDetailsContract.Presenter {

  private final UserDetailsContract.View view;
  private final UserViewModel user;
  private final BaseSchedulerProvider schedulerProvider;

  UserDetailsPresenter(UserDetailsContract.View view, UserViewModel user,
      BaseSchedulerProvider schedulerProvider) {
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
