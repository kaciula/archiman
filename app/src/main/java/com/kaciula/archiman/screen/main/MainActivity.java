package com.kaciula.archiman.screen.main;

import android.os.Bundle;
import android.view.View;

import com.kaciula.archiman.R;
import com.kaciula.archiman.injection.AppComponent;
import com.kaciula.archiman.ui.ArchimanActivity;

public class MainActivity extends ArchimanActivity {

    private MainComponent component;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.view_main);
    }

    @Override
    protected void setupComponent(AppComponent appComponent) {
        component = DaggerMainComponent.builder()
                .appComponent(appComponent)
                .mainModule(new MainModule(this))
                .build();
        component.inject(this);
    }

    @Override
    protected void inject(View view) {
        component.inject((MainView) view);
    }
}
