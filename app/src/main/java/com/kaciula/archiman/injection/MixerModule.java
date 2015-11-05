package com.kaciula.archiman.injection;

import com.kaciula.archiman.net.GithubApi;
import com.kaciula.archiman.screen.main.MainMixer;

import dagger.Module;
import dagger.Provides;

@Module
public class MixerModule {

    @Provides
    MainMixer provideMainMixer(GithubApi githubApi) {
        return new MainMixer(githubApi);
    }
}
