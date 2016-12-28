package com.kaciula.archiman.util.injection;

import com.kaciula.archiman.domain.usecase.GetUsersUsecase;
import com.kaciula.archiman.infrastructure.ArchimanApplication;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;

public interface BaseAppComponent {

  void inject(ArchimanApplication application);

  BaseSchedulerProvider schedulerProvider();

  GetUsersUsecase getUsersUsecase();
}
