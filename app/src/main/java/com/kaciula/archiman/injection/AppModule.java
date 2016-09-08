package com.kaciula.archiman.injection;

import android.content.Context;

import com.kaciula.archiman.component.BaseApplication;
import com.kaciula.archiman.util.AppManager;
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
    AppManager provideAppManager() {
        return new AppManager();
    }

    @Provides
    @Singleton
    BaseSchedulerProvider provideSchedulerProvider() {
        return new SchedulerProvider();
    }
}
