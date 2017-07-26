package com.kaciula.archiman.injection;

import com.kaciula.archiman.domain.usecases.GetUsers;
import com.kaciula.archiman.domain.util.SchedulerProvider;
import com.kaciula.archiman.infrastructure.ArchimanApplication;

interface BaseAppComponent {

  void inject(ArchimanApplication application);

  SchedulerProvider schedulerProvider();

  GetUsers getUsersUseCase();
}
