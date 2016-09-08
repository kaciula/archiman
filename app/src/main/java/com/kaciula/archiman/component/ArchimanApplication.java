package com.kaciula.archiman.component;

import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.injection.AppComponent;
import com.kaciula.archiman.injection.AppModule;
import com.kaciula.archiman.injection.DaggerAppComponent;
import com.kaciula.archiman.util.AppManager;
import com.kaciula.archiman.util.CrashlyticsTree;
import com.kaciula.archiman.util.MiscUtils;
import com.squareup.leakcanary.LeakCanary;

import javax.inject.Inject;

import io.fabric.sdk.android.Fabric;
import timber.log.Timber;

public class ArchimanApplication extends BaseApplication {

    private AppComponent appComponent;

    @Inject
    AppManager appManager;

    @Override
    public void onCreate() {
        super.onCreate();

        if (BuildConfig.DEBUG) {
            Timber.plant(new Timber.DebugTree());
            LeakCanary.install(this);
        } else {
            startCrashlytics();
            Timber.plant(new CrashlyticsTree());
        }

        appComponent = DaggerAppComponent.builder()
                .appModule(new AppModule())
                .build();
        appComponent.inject(this);

        appManager.initializeEveryColdStart();
    }

    public static AppComponent component() {
        return ((ArchimanApplication) getContext()).appComponent;
    }

    public void startCrashlytics() {
        Fabric.with(this, new Crashlytics());
        Crashlytics.setUserIdentifier(MiscUtils.getDeviceId());
        Crashlytics.setString("Installer", MiscUtils.getInstaller());
        Crashlytics.setString("Git SHA", BuildConfig.GIT_SHA);
    }
}
