package com.kaciula.archiman.domain.util;

import com.kaciula.archiman.domain.repository.PrefsRepository;
import com.kaciula.archiman.domain.repository.UsersRepository;
import com.kaciula.archiman.domain.usecase.GetUsers;
import com.kaciula.archiman.domain.usecase.InitColdStart;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public final class UseCaseModule {

  @Provides
  @Singleton
  GetUsers provideGetUsersUsecase(UsersRepository usersRepository) {
    return new GetUsers(usersRepository);
  }

  @Provides
  @Singleton
  InitColdStart provideInitColdStartUsecase(PrefsRepository prefsRepository) {
    return new InitColdStart(prefsRepository);
  }
}
