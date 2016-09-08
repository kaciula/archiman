package com.kaciula.archiman.screen.main;

import android.os.Bundle;

import com.kaciula.archiman.R;
import com.kaciula.archiman.component.ArchimanApplication;
import com.kaciula.archiman.ui.ArchimanActivity;

import javax.inject.Inject;

import butterknife.BindView;
import butterknife.ButterKnife;

public class MainActivity extends ArchimanActivity {

    @Inject
    MainPresenter presenter;

    @BindView(R.id.view_main)
    MainView mainView;

    private MainComponent component;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);

        setupComponent();
    }

    private void setupComponent() {
        component = DaggerMainComponent.builder()
                .appComponent(ArchimanApplication.get().component())
                .mainModule(new MainModule(this, mainView))
                .build();
        component.inject(this);
    }

    public MainComponent component() {
        return component;
    }
}
