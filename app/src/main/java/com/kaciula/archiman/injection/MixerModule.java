package com.kaciula.archiman.injection;

import com.kaciula.archiman.screen.main.MainMixer;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module(
        complete = false,
        library = true
)
public class MixerModule {

    @Provides
    @Singleton
    MainMixer provideMainMixer() {
        return new MainMixer();
    }
}
