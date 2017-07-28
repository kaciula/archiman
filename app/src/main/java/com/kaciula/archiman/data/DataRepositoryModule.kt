package com.kaciula.archiman.data

import com.kaciula.archiman.data.local.database.UserLocalDataSource
import com.kaciula.archiman.data.remote.StackExchangeApi
import com.kaciula.archiman.data.remote.UserRemoteDataSource
import com.kaciula.archiman.domain.boundary.data.AppInfoRepository
import com.kaciula.archiman.domain.boundary.data.UserRepository
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module
class DataRepositoryModule {

    @Singleton
    @Provides
    fun providerUsersRepository(stackExchangeApi: StackExchangeApi): UserRepository {
        return UserRepositoryImpl(UserRemoteDataSource(stackExchangeApi),
                UserLocalDataSource())
    }

    @Provides
    @Singleton
    fun provideAppInfoRepository(): AppInfoRepository {
        return AppInfoRepositoryImpl()
    }
}
