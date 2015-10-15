package com.kaciula.archiman.util;

import android.app.Application;

import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.injection.Modules;

import net.danlew.android.joda.JodaTimeAndroid;

import javax.inject.Inject;

import dagger.ObjectGraph;
import io.fabric.sdk.android.Fabric;
import timber.log.Timber;

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

        if (BuildConfig.DEBUG) {
            Timber.plant(new Timber.DebugTree());
        } else {
            startCrashlytics();
            Timber.plant(new CrashlyticsTree());
        }

        JodaTimeAndroid.init(this);
        globalStateManager.initializeEveryColdStart();
    }

    public static ArchimanApplication get() {
        return app;
    }

    private void buildObjectGraphAndInject() {
        graph = ObjectGraph.create(Modules.list(this));
        graph.inject(this);
    }

    public void inject(Object object) {
        graph.inject(object);
    }

    public ObjectGraph getObjectGraph() {
        return graph;
    }

    public void startCrashlytics() {
        Fabric.with(this, new Crashlytics());
        Crashlytics.setUserIdentifier(MiscUtils.getDeviceId());
        Crashlytics.setString("Installer", MiscUtils.getInstaller());
        Crashlytics.setString("Git SHA", BuildConfig.GIT_SHA);
    }
}
