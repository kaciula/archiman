package com.kaciula.archiman.domain.usecase;

import com.kaciula.archiman.domain.abstractions.PrefsRepository;
import com.kaciula.archiman.domain.abstractions.UsersRepository;
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
