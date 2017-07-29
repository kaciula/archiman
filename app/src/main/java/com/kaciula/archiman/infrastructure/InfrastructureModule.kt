package com.kaciula.archiman.infrastructure

import android.content.Context
import com.kaciula.archiman.BuildConfig
import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import com.kaciula.archiman.infrastructure.boundary.CrashlyticsCrashReporter
import com.kaciula.archiman.infrastructure.boundary.DummyCrashReporter
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module
class InfrastructureModule {

    @Provides
    @Singleton
    fun provideCrashReporter(context: Context): CrashReporter {
        return if (BuildConfig.DEBUG) DummyCrashReporter() else CrashlyticsCrashReporter(context)
    }
}
