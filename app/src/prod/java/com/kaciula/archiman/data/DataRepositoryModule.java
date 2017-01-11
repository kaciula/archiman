package com.kaciula.archiman.data;

import com.kaciula.archiman.data.remote.StackExchangeApi;
import com.kaciula.archiman.data.remote.UsersRemoteDataSource;
import com.kaciula.archiman.domain.repository.UsersRepository;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public class DataRepositoryModule {

  @Singleton
  @Provides
  UsersRepository providerUsersRepository(StackExchangeApi stackExchangeApi) {
    return new UsersDataRepository(new UsersRemoteDataSource(stackExchangeApi));
  }
}
