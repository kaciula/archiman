package com.kaciula.archiman.domain.usecase;

import com.kaciula.archiman.data.UsersRepository;
import com.kaciula.archiman.data.local.prefs.PrefsRepository;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public final class UsecaseModule {

  @Provides
  @Singleton
  GetUsersUsecase provideGetUsersUsecase(UsersRepository usersRepository) {
    return new GetUsersUsecase(usersRepository);
  }

  @Provides
  @Singleton
  InitColdStartUsecase provideInitColdStartUsecase(PrefsRepository prefsRepository) {
    return new InitColdStartUsecase(prefsRepository);
  }
}
