package com.kaciula.archiman.infrastructure.injection

import android.content.Context
import android.content.SharedPreferences
import com.kaciula.archiman.infrastructure.data.local.prefs.util.BooleanPreference
import com.kaciula.archiman.infrastructure.data.local.prefs.util.IntPreference
import dagger.Module
import dagger.Provides
import javax.inject.Named
import javax.inject.Singleton

@Module
class PrefsModule {

    @Provides
    @Singleton
    fun provideSharedPreferences(ctx: Context): SharedPreferences {
        return ctx.getSharedPreferences("prefs_utils", Context.MODE_PRIVATE)
    }

    @Provides
    @Named("first_time")
    @Singleton
    fun provideFirstTimePreference(preferences: SharedPreferences): BooleanPreference {
        return BooleanPreference(preferences, "first_time", true)
    }

    @Provides
    @Named("version_code")
    @Singleton
    fun provideVersionCodePreference(preferences: SharedPreferences): IntPreference {
        return IntPreference(preferences, "version_code", 0)
    }
}
