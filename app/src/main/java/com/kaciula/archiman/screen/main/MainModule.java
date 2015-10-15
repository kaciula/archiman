package com.kaciula.archiman.screen.main;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module(
        complete = false,
        library = true,
        injects = {
                MainActivity.class,
                MainView.class
        }
)
public class MainModule {
    private MainActivity activity;

    public MainModule(MainActivity activity) {
        this.activity = activity;
    }

    @Provides
    @Singleton
    MainActivity provideActivity() {
        return activity;
    }

    @Provides
    @Singleton
    MainPresenter providePresenter(MainMixer mainMixer) {
        return new MainPresenter(activity, mainMixer);
    }
}
