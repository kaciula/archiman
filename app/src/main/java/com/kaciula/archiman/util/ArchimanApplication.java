package com.kaciula.archiman.util;

import android.app.Application;

import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.injection.ArchimanComponent;
import com.kaciula.archiman.injection.ArchimanModule;
import com.kaciula.archiman.injection.DaggerArchimanComponent;
import com.kaciula.archiman.injection.MixerModule;
import com.kaciula.archiman.net.NetModule;
import com.kaciula.archiman.persistence.PrefsModule;

import net.danlew.android.joda.JodaTimeAndroid;

import javax.inject.Inject;

import io.fabric.sdk.android.Fabric;
import timber.log.Timber;

public class ArchimanApplication extends Application {

    private static ArchimanApplication app;

    private ArchimanComponent component;
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
        component = DaggerArchimanComponent.builder()
                .archimanModule(new ArchimanModule(this))
                .prefsModule(new PrefsModule())
                .netModule(new NetModule())
                .mixerModule(new MixerModule())
                .build();
        component.inject(this);
    }

    public ArchimanComponent component() {
        return component;
    }

    public void startCrashlytics() {
        Fabric.with(this, new Crashlytics());
        Crashlytics.setUserIdentifier(MiscUtils.getDeviceId());
        Crashlytics.setString("Installer", MiscUtils.getInstaller());
        Crashlytics.setString("Git SHA", BuildConfig.GIT_SHA);
    }
}
