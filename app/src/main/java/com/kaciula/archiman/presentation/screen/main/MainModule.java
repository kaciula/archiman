package com.kaciula.archiman.presentation.screen.main;

import com.kaciula.archiman.domain.usecase.GetUsersUsecase;
import com.kaciula.archiman.util.injection.ActivityScope;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import dagger.Module;
import dagger.Provides;

@Module
class MainModule {
  private final MainContract.Container container;
  private final MainContract.View view;

  MainModule(MainContract.Container container, MainContract.View view) {
    this.container = container;
    this.view = view;
  }

  @Provides
  @ActivityScope
  MainContract.Presenter providePresenter(BaseSchedulerProvider schedulerProvider,
      GetUsersUsecase getUsersUsecase) {
    return new MainPresenter(container, view, schedulerProvider, getUsersUsecase);
  }
}
