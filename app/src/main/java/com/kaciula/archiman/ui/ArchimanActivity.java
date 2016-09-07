package com.kaciula.archiman.ui;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.injection.AppComponent;
import com.kaciula.archiman.util.ArchimanApplication;

public abstract class ArchimanActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setupComponent(ArchimanApplication.get().component());
        if (!BuildConfig.DEBUG)
            Crashlytics.setString("current screen", getLocalClassName());
    }

    protected abstract void setupComponent(AppComponent component);

    protected abstract void inject(View view);
}
