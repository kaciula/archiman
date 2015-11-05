package com.kaciula.archiman.persistence;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

import com.kaciula.archiman.injection.ApplicationScope;
import com.kaciula.archiman.persistence.prefs.BooleanPreference;
import com.kaciula.archiman.persistence.prefs.IntPreference;

import javax.inject.Named;

import dagger.Module;
import dagger.Provides;

@Module
public class PrefsModule {

    @Provides
    @ApplicationScope
    SharedPreferences provideSharedPreferences(Application app) {
        return app.getSharedPreferences("prefs_utils", Context.MODE_PRIVATE);
    }

    @Provides
    @Named("first_time")
    @ApplicationScope
    BooleanPreference provideFirstTimePreference(SharedPreferences preferences) {
        return new BooleanPreference(preferences, "first_time", true);
    }

    @Provides
    @Named("version_code")
    @ApplicationScope
    IntPreference provideVersionCodePreference(SharedPreferences preferences) {
        return new IntPreference(preferences, "version_code", 0);
    }
}
