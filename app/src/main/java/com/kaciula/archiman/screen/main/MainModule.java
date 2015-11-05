package com.kaciula.archiman.screen.main;

import dagger.Module;
import dagger.Provides;

@Module
public class MainModule {
    private MainActivity activity;

    public MainModule(MainActivity activity) {
        this.activity = activity;
    }

    @Provides
    MainActivity provideActivity() {
        return activity;
    }

    @Provides
    MainPresenter providePresenter(MainMixer mainMixer) {
        return new MainPresenter(activity, mainMixer);
    }
}
