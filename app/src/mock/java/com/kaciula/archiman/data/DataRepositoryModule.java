package com.kaciula.archiman.data;

import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public class DataRepositoryModule {

  @Singleton
  @Provides
  UsersRepository providerUsersRepository() {
    return new UsersRepository(new FakeUsersDataSource());
  }
}
