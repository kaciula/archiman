package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.abstractions.UsersRepository;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public class DataRepositoryModule {

  @Singleton
  @Provides
  UsersRepository providerUsersRepository() {
    return new UsersDataRepository(new FakeUsersDataSource());
  }
}
