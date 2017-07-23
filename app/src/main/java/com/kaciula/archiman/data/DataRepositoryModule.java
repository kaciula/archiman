package com.kaciula.archiman.data;

import com.kaciula.archiman.data.local.database.UsersLocalDataSource;
import com.kaciula.archiman.data.remote.StackExchangeApi;
import com.kaciula.archiman.data.remote.UsersRemoteDataSource;
import com.kaciula.archiman.domain.boundary.data.AppInfoRepository;
import com.kaciula.archiman.domain.boundary.data.UserRepository;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public class DataRepositoryModule {

  @Singleton
  @Provides
  UserRepository providerUsersRepository(StackExchangeApi stackExchangeApi) {
    return new UserRepositoryImpl(new UsersRemoteDataSource(stackExchangeApi),
        new UsersLocalDataSource());
  }

  @Provides
  @Singleton
  AppInfoRepository provideAppInfoRepository() {
    return new AppInfoRepositoryImpl();
  }
}
