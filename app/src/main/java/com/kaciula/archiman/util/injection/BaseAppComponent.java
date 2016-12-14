package com.kaciula.archiman.util.injection;

import com.kaciula.archiman.data.UsersRepository;
import com.kaciula.archiman.data.remote.StackExchangeApi;
import com.kaciula.archiman.util.AppManager;
import com.kaciula.archiman.util.ArchimanApplication;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;

public interface BaseAppComponent {

  void inject(ArchimanApplication application);

  void inject(AppManager appManager);

  StackExchangeApi githubApi();

  BaseSchedulerProvider schedulerProvider();

  UsersRepository usersRepository();
}
