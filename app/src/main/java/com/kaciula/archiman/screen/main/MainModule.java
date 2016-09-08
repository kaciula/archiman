package com.kaciula.archiman.screen.main;

import com.kaciula.archiman.data.remote.GithubApi;
import com.kaciula.archiman.injection.ActivityScope;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;

import dagger.Module;
import dagger.Provides;

@Module
public class MainModule {
    private MainContract.Container container;
    private MainContract.View view;

    public MainModule(MainContract.Container container, MainContract.View view) {
        this.container = container;
        this.view = view;
    }

    @Provides
    @ActivityScope
    MainPresenter providePresenter(BaseSchedulerProvider schedulerProvider, GithubApi githubApi) {
        return new MainPresenter(container, view, schedulerProvider, githubApi);
    }
}
