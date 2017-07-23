package com.kaciula.archiman.domain.util;

import com.kaciula.archiman.domain.boundary.SchedulerProvider;
import com.kaciula.archiman.domain.boundary.data.AppInfoRepository;
import com.kaciula.archiman.domain.boundary.data.UserRepository;
import com.kaciula.archiman.domain.usecases.GetUsers;
import com.kaciula.archiman.domain.usecases.InitColdStart;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public final class DomainModule {

  @Provides
  @Singleton
  GetUsers provideGetUsers(UserRepository userRepository, SchedulerProvider schedulerProvider) {
    return new GetUsers(userRepository, schedulerProvider);
  }

  @Provides
  @Singleton
  InitColdStart provideInitColdStart(AppInfoRepository appInfoRepository) {
    return new InitColdStart(appInfoRepository);
  }
}
