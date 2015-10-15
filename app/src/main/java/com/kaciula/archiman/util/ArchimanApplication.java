package com.kaciula.archiman.util;

import android.app.Application;

public class ArchimanApplication extends Application {

    private static ArchimanApplication app;

    @Override
    public void onCreate() {
        super.onCreate();
        ArchimanApplication.app = this;
    }

    public static ArchimanApplication get() {
        return app;
    }
}
