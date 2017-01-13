package com.kaciula.archiman.presentation.screen.home;

import com.kaciula.archiman.domain.usecase.GetUsers;
import com.kaciula.archiman.util.injection.ActivityScope;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
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
  HomeContract.Presenter providePresenter(BaseSchedulerProvider schedulerProvider,
      GetUsers getUsers) {
    return new HomePresenter(view, schedulerProvider, getUsers);
  }
}
