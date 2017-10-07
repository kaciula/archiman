package com.kaciula.archiman.injection

import com.kaciula.archiman.domain.boundary.data.AppInfoRepository
import com.kaciula.archiman.domain.boundary.data.UserRepository
import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.domain.usecases.InitColdStart
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module
class DomainModule {

    @Provides
    @Singleton
    fun provideGetUsers(userRepository: UserRepository): GetUsers {
        return GetUsers(userRepository)
    }

    @Provides
    @Singleton
    fun provideInitColdStart(appInfoRepository: AppInfoRepository): InitColdStart {
        return InitColdStart(appInfoRepository)
    }
}
