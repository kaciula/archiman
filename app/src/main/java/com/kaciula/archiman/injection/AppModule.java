package com.kaciula.archiman.injection;

import android.app.Application;

import com.kaciula.archiman.component.ArchimanApplication;
import com.kaciula.archiman.util.AppManager;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import com.kaciula.archiman.util.scheduler.SchedulerProvider;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public final class AppModule {

    private final ArchimanApplication app;

    public AppModule(ArchimanApplication app) {
        this.app = app;
    }

    @Provides
    @Singleton
    Application provideApplication() {
        return app;
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
