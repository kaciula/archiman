package com.kaciula.archiman.injection

import com.kaciula.archiman.domain.boundary.infrastructure.AppRepository
import com.kaciula.archiman.domain.boundary.infrastructure.UserRepository
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
    fun provideInitColdStart(appRepository: AppRepository): InitColdStart {
        return InitColdStart(appRepository)
    }
}
