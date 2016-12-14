package com.kaciula.archiman.data;

import com.kaciula.archiman.data.remote.StackExchangeApi;
import com.kaciula.archiman.data.remote.UsersRemoteDataSource;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public class DataRepositoryModule {

  @Singleton
  @Provides
  UsersRepository providerUsersRepository(StackExchangeApi stackExchangeApi) {
    return new UsersRepository(new UsersRemoteDataSource(stackExchangeApi));
  }
}
