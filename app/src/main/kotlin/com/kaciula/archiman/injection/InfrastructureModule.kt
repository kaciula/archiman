package com.kaciula.archiman.injection

import android.content.Context
import com.kaciula.archiman.BuildConfig
import com.kaciula.archiman.domain.boundary.infrastructure.AppRepository
import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import com.kaciula.archiman.domain.boundary.infrastructure.UserRepository
import com.kaciula.archiman.infrastructure.boundary.AppRepositoryImpl
import com.kaciula.archiman.infrastructure.boundary.CrashlyticsCrashReporter
import com.kaciula.archiman.infrastructure.boundary.DummyCrashReporter
import com.kaciula.archiman.infrastructure.boundary.UserRepositoryImpl
import com.kaciula.archiman.infrastructure.data.local.database.UserLocalDataStore
import com.kaciula.archiman.infrastructure.data.remote.StackExchangeApi
import com.kaciula.archiman.infrastructure.data.remote.UserRemoteDataStore
import com.kaciula.archiman.infrastructure.data.util.moshi.MoshiLocalDateAdapter
import com.kaciula.archiman.infrastructure.data.util.moshi.MoshiLocalDateTimeAdapter
import com.kaciula.archiman.infrastructure.data.util.moshi.MoshiLocalTimeAdapter
import com.squareup.moshi.Moshi
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module(includes = arrayOf(RemoteModule::class))
class InfrastructureModule {

    @Provides
    @Singleton
    fun provideMoshi(): Moshi {
        return Moshi.Builder()
                .add(MoshiLocalDateTimeAdapter())
                .add(MoshiLocalDateAdapter())
                .add(MoshiLocalTimeAdapter())
                .build()
    }

    @Singleton
    @Provides
    fun providerUserRepository(stackExchangeApi: StackExchangeApi): UserRepository {
        return UserRepositoryImpl(UserRemoteDataStore(stackExchangeApi),
                UserLocalDataStore())
    }

    @Provides
    @Singleton
    fun provideAppRepository(): AppRepository {
        return AppRepositoryImpl()
    }

    @Provides
    @Singleton
    fun provideCrashReporter(context: Context): CrashReporter {
        return if (BuildConfig.DEBUG) DummyCrashReporter() else CrashlyticsCrashReporter(context)
    }
}
