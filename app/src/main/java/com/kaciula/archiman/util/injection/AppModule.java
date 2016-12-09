package com.kaciula.archiman.util.injection;

import android.content.Context;

import com.kaciula.archiman.data.local.prefs.PrefsRepository;
import com.kaciula.archiman.util.AppManager;
import com.kaciula.archiman.util.BaseApplication;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import com.kaciula.archiman.util.scheduler.SchedulerProvider;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

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
