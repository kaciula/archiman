package com.kaciula.archiman.screen.main;

import com.kaciula.archiman.injection.ActivityScope;

import dagger.Module;
import dagger.Provides;

@Module
public class MainModule {
    private MainActivity activity;

    public MainModule(MainActivity activity) {
        this.activity = activity;
    }

    @Provides
    @ActivityScope
    MainActivity provideActivity() {
        return activity;
    }

    @Provides
    @ActivityScope
    MainPresenter providePresenter(MainMixer mainMixer) {
        return new MainPresenter(activity, mainMixer);
    }
}
