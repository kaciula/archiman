package com.kaciula.archiman.data;

import com.kaciula.archiman.data.remote.GithubApi;
import com.kaciula.archiman.data.remote.UsersRemoteDataSource;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class DataRepositoryModule {

    @Singleton
    @Provides
    DataRepository providerDataRepository(GithubApi githubApi) {
        return new DataRepository(new UsersRemoteDataSource(githubApi));
    }
}
