package com.kaciula.archiman.component;

import android.app.Application;

import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.injection.AppComponent;
import com.kaciula.archiman.injection.AppModule;
import com.kaciula.archiman.injection.DaggerAppComponent;
import com.kaciula.archiman.util.AppManager;
import com.kaciula.archiman.util.CrashlyticsTree;
import com.kaciula.archiman.util.MiscUtils;
import com.squareup.leakcanary.LeakCanary;

import net.danlew.android.joda.JodaTimeAndroid;

import javax.inject.Inject;

import io.fabric.sdk.android.Fabric;
import timber.log.Timber;

public class ArchimanApplication extends Application {

    private static ArchimanApplication app;

    private AppComponent component;
    @Inject
    protected AppManager appManager;

    @Override
    public void onCreate() {
        super.onCreate();
        ArchimanApplication.app = this;
        buildObjectGraphAndInject();

        if (BuildConfig.DEBUG) {
            Timber.plant(new Timber.DebugTree());
            LeakCanary.install(this);
        } else {
            startCrashlytics();
            Timber.plant(new CrashlyticsTree());
        }

        JodaTimeAndroid.init(this);
        appManager.initializeEveryColdStart();
    }

    public static ArchimanApplication get() {
        return app;
    }

    private void buildObjectGraphAndInject() {
        component = DaggerAppComponent.builder()
                .appModule(new AppModule(this))
                .build();
        component.inject(this);
    }

    public AppComponent component() {
        return component;
    }

    public void startCrashlytics() {
        Fabric.with(this, new Crashlytics());
        Crashlytics.setUserIdentifier(MiscUtils.getDeviceId());
        Crashlytics.setString("Installer", MiscUtils.getInstaller());
        Crashlytics.setString("Git SHA", BuildConfig.GIT_SHA);
    }
}
