package com.kaciula.archiman.util.injection;

import android.content.Context;
import com.kaciula.archiman.data.local.prefs.PrefsRepository;
import com.kaciula.archiman.infrastructure.AppManager;
import com.kaciula.archiman.infrastructure.BaseApplication;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import com.kaciula.archiman.util.scheduler.SchedulerProvider;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public final class AppModule {

  @Provides
  @Singleton
  Context provideContext() {
    return BaseApplication.getContext();
  }

  @Provides
  @Singleton
  AppManager provideAppManager(PrefsRepository prefsRepository) {
    return new AppManager(prefsRepository);
  }

  @Provides
  @Singleton
  BaseSchedulerProvider provideSchedulerProvider() {
    return new SchedulerProvider();
  }
}
