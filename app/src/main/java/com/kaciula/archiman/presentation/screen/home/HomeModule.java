package com.kaciula.archiman.presentation.screen.home;

import com.kaciula.archiman.domain.boundary.SchedulerProvider;
import com.kaciula.archiman.domain.usecases.GetUsers;
import com.kaciula.archiman.injection.ActivityScope;
import dagger.Module;
import dagger.Provides;

@Module
class HomeModule {
  private final HomeContract.View view;

  HomeModule(HomeContract.View view) {
    this.view = view;
  }

  @Provides
  @ActivityScope
  HomeContract.Presenter providePresenter(SchedulerProvider schedulerProvider,
      GetUsers getUsers) {
    return new HomePresenter(view, schedulerProvider, getUsers);
  }
}
