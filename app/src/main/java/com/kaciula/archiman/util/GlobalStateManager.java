package com.kaciula.archiman.util;

import android.app.Application;

import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.persistence.prefs.BooleanPreference;
import com.kaciula.archiman.persistence.prefs.IntPreference;

import java.util.concurrent.ExecutorService;

import javax.inject.Inject;
import javax.inject.Named;

import timber.log.Timber;

public class GlobalStateManager {

    private Application app;
    private ExecutorService executorService;

    @Inject
    @Named("first_time")
    protected BooleanPreference firstTimePref;
    @Inject
    @Named("version_code")
    protected IntPreference versionCodePref;

    public GlobalStateManager(Application app, ExecutorService executorService) {
        this.app = app;
        this.executorService = executorService;
    }

    public void initializeEveryColdStart() {
        Timber.d("Initialize every cold start");
        int currentVersionCode = BuildConfig.VERSION_CODE;
        if (firstTimePref.get()) {
            Timber.d("First time running the app");
            firstTimePref.set(false);
            versionCodePref.set(currentVersionCode);
        } else {
            if (versionCodePref.get() < currentVersionCode) {
                Timber.d("Old version code " + versionCodePref.get() + " is replaced with new " +
                        "version code " + currentVersionCode);
                versionCodePref.set(currentVersionCode);
            } else {
                Timber.d("Just a basic cold start");
            }
        }
    }
}
