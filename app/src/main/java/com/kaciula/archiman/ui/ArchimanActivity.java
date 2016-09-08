package com.kaciula.archiman.ui;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.BuildConfig;

public abstract class ArchimanActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (!BuildConfig.DEBUG)
            Crashlytics.setString("current screen", getLocalClassName());
    }
}
