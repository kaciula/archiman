package com.kaciula.archiman.data;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class DataRepositoryModule {

    @Singleton
    @Provides
    DataRepository providerDataRepository() {
        return new DataRepository(new FakeUsersDataSource());
    }
}
