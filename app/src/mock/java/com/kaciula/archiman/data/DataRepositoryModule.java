package com.kaciula.archiman.data;

import com.kaciula.archiman.data.local.database.UsersLocalDataSource;
import com.kaciula.archiman.domain.repository.AppInfoRepository;
import com.kaciula.archiman.domain.repository.UsersRepository;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public class DataRepositoryModule {

  @Singleton
  @Provides
  UsersRepository providerUsersRepository() {
    return new UsersDataRepository(new FakeUsersDataSource(), new UsersLocalDataSource());
  }

  @Provides
  @Singleton
  AppInfoRepository provideAppInfoRepository() {
    return new AppInfoDataRepository();
  }
}
