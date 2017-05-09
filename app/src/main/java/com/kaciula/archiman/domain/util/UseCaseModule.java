package com.kaciula.archiman.domain.util;

import com.kaciula.archiman.domain.repository.AppInfoRepository;
import com.kaciula.archiman.domain.repository.UsersRepository;
import com.kaciula.archiman.domain.usecase.GetUsers;
import com.kaciula.archiman.domain.usecase.InitColdStart;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public final class UseCaseModule {

  @Provides
  @Singleton
  GetUsers provideGetUsersUsecase(UsersRepository usersRepository,
      BaseSchedulerProvider schedulerProvider) {
    return new GetUsers(usersRepository, schedulerProvider);
  }

  @Provides
  @Singleton
  InitColdStart provideInitColdStartUsecase(AppInfoRepository appInfoRepository) {
    return new InitColdStart(appInfoRepository);
  }
}
