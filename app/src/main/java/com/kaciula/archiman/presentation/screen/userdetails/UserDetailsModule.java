package com.kaciula.archiman.presentation.screen.userdetails;

import com.kaciula.archiman.presentation.screen.home.UserViewModel;
import com.kaciula.archiman.util.injection.ActivityScope;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import dagger.Module;
import dagger.Provides;

@Module
class UserDetailsModule {

  private final UserDetailsContract.View view;
  private UserViewModel user;

  UserDetailsModule(UserDetailsContract.View view, UserViewModel user) {
    this.view = view;
    this.user = user;
  }

  @Provides
  @ActivityScope
  UserDetailsContract.Presenter providePresenter(BaseSchedulerProvider schedulerProvider) {
    return new UserDetailsPresenter(view, user, schedulerProvider);
  }
}
