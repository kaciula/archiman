package com.kaciula.archiman.data.local.prefs;

import android.content.Context;
import android.content.SharedPreferences;

import com.kaciula.archiman.data.local.prefs.util.BooleanPreference;
import com.kaciula.archiman.data.local.prefs.util.IntPreference;

import javax.inject.Named;
import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class PrefsModule {

    @Provides
    @Singleton
    SharedPreferences provideSharedPreferences(Context ctx) {
        return ctx.getSharedPreferences("prefs_utils", Context.MODE_PRIVATE);
    }

    @Provides
    @Singleton
    PrefsRepository providePrefsRepository() {
        return new PrefsRepository();
    }

    @Provides
    @Named("first_time")
    @Singleton
    BooleanPreference provideFirstTimePreference(
            SharedPreferences preferences) {
        return new BooleanPreference(preferences, "first_time", true);
    }

    @Provides
    @Named("version_code")
    @Singleton
    IntPreference provideVersionCodePreference(
            SharedPreferences preferences) {
        return new IntPreference(preferences, "version_code", 0);
    }
}
