package com.kaciula.archiman.injection;

import com.kaciula.archiman.data.DataModule;
import com.kaciula.archiman.net.RemoteModule;
import com.kaciula.archiman.persistence.PrefsModule;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(modules = {AppModule.class, DataModule.class, PrefsModule.class, RemoteModule.class,
        MixerModule.class})
public interface AppComponent extends BaseArchimanComponent {
}
