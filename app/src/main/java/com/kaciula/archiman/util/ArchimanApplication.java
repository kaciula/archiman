package com.kaciula.archiman.util;

import android.app.Application;

import com.kaciula.archiman.injection.Modules;

import javax.inject.Inject;

import dagger.ObjectGraph;

public class ArchimanApplication extends Application {

    private static ArchimanApplication app;

    private ObjectGraph graph;
    @Inject
    protected GlobalStateManager globalStateManager;

    @Override
    public void onCreate() {
        super.onCreate();
        ArchimanApplication.app = this;
        buildObjectGraphAndInject();

        globalStateManager.initializeEveryColdStart();
    }

    public static ArchimanApplication get() {
        return app;
    }

    public void buildObjectGraphAndInject() {
        graph = ObjectGraph.create(Modules.list(this));
        graph.inject(this);
    }
}
