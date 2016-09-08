package com.kaciula.archiman.screen.main;

import com.kaciula.archiman.injection.ActivityScope;

import dagger.Module;
import dagger.Provides;

@Module
public class MainModule {
    private MainActivity activity;
    private MainContract.View view;

    public MainModule(MainActivity activity, MainContract.View view) {
        this.activity = activity;
        this.view = view;
    }

    @Provides
    @ActivityScope
    MainPresenter providePresenter(MainMixer mainMixer) {
        return new MainPresenter(activity, view, mainMixer);
    }
}
