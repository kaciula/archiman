package com.kaciula.archiman.screen.main;

import com.kaciula.archiman.injection.ActivityScope;
import com.kaciula.archiman.injection.ArchimanComponent;

import dagger.Component;

@ActivityScope
@Component(
        dependencies = ArchimanComponent.class,
        modules = MainModule.class
)
public interface MainComponent {

    void inject(MainActivity activity);

    void inject(MainView view);
}
