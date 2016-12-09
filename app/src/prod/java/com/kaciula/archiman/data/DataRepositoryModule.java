package com.kaciula.archiman.data;

import com.kaciula.archiman.data.remote.StackExchangeApi;
import com.kaciula.archiman.data.remote.UsersRemoteDataSource;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class DataRepositoryModule {

    @Singleton
    @Provides
    DataRepository providerDataRepository(StackExchangeApi stackExchangeApi) {
        return new DataRepository(new UsersRemoteDataSource(stackExchangeApi));
    }
}
