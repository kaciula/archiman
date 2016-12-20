package com.kaciula.archiman.domain.usecase;

import com.kaciula.archiman.data.UsersRepository;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public final class UsecaseModule {

  @Provides
  @Singleton
  FetchUsersUsecase provideFetchUsersUsecase(UsersRepository usersRepository) {
    return new FetchUsersUsecase(usersRepository);
  }
}
