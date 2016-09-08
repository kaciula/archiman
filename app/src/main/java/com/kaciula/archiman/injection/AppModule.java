package com.kaciula.archiman.injection;

import android.app.Application;
import android.support.annotation.NonNull;

import com.kaciula.archiman.component.ArchimanApplication;
import com.kaciula.archiman.util.AppManager;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

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
    ExecutorService provideExecutor() {
        return Executors.newCachedThreadPool(new ThreadFactory() {
            @Override
            public Thread newThread(@NonNull final Runnable r) {
                return new Thread(new Runnable() {
                    @Override
                    public void run() {
                        android.os.Process.setThreadPriority(android.os.Process
                                .THREAD_PRIORITY_BACKGROUND);
                        r.run();
                    }
                });
            }
        });
    }

    @Provides
    @Singleton
    AppManager provideAppManager(Application app, ExecutorService executorService) {
        return new AppManager(app, executorService);
    }
}
