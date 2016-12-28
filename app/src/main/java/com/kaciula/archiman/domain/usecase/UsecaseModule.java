package com.kaciula.archiman.domain.usecase;

import com.kaciula.archiman.data.UsersRepository;
import com.kaciula.archiman.data.local.prefs.PrefsRepository;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public final class UseCaseModule {

  @Provides
  @Singleton
  GetUsersUseCase provideGetUsersUsecase(UsersRepository usersRepository) {
    return new GetUsersUseCase(usersRepository);
  }

  @Provides
  @Singleton
  InitColdStartUseCase provideInitColdStartUsecase(PrefsRepository prefsRepository) {
    return new InitColdStartUseCase(prefsRepository);
  }
}
