package com.kaciula.archiman.data;

import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public class DataRepositoryModule {

  @Singleton
  @Provides
  DataRepository providerDataRepository() {
    return new DataRepository(new FakeUsersDataSource());
  }
}
