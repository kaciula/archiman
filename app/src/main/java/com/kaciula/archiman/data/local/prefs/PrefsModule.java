package com.kaciula.archiman.data.local.prefs;

import android.content.Context;
import android.content.SharedPreferences;
import com.kaciula.archiman.data.local.prefs.util.BooleanPreference;
import com.kaciula.archiman.data.local.prefs.util.IntPreference;
import com.kaciula.archiman.domain.abstractions.PrefsRepository;
import dagger.Module;
import dagger.Provides;
import javax.inject.Named;
import javax.inject.Singleton;

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
    return new PrefsDataRepository();
  }

  @Provides
  @Named("first_time")
  @Singleton
  BooleanPreference provideFirstTimePreference(SharedPreferences preferences) {
    return new BooleanPreference(preferences, "first_time", true);
  }

  @Provides
  @Named("version_code")
  @Singleton
  IntPreference provideVersionCodePreference(SharedPreferences preferences) {
    return new IntPreference(preferences, "version_code", 0);
  }
}
