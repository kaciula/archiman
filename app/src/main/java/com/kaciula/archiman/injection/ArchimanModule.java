package com.kaciula.archiman.injection;

import android.app.Application;
import android.support.annotation.NonNull;

import com.kaciula.archiman.util.ArchimanApplication;
import com.kaciula.archiman.util.GlobalStateManager;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

import dagger.Module;
import dagger.Provides;

@Module
public final class ArchimanModule {

    private final ArchimanApplication app;

    public ArchimanModule(ArchimanApplication app) {
        this.app = app;
    }

    @Provides
    @ApplicationScope
    Application provideApplication() {
        return app;
    }

    @Provides
    @ApplicationScope
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
    @ApplicationScope
    GlobalStateManager provideGlobalStateManager(Application app, ExecutorService executorService) {
        return new GlobalStateManager(app, executorService);
    }
}
