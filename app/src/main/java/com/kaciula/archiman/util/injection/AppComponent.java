package com.kaciula.archiman.util.injection;

import com.kaciula.archiman.data.DataModule;
import com.kaciula.archiman.data.DataRepositoryModule;
import com.kaciula.archiman.data.local.prefs.PrefsModule;
import com.kaciula.archiman.data.remote.RemoteModule;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(modules = {AppModule.class, DataModule.class, PrefsModule.class, RemoteModule.class,
        DataRepositoryModule.class})
public interface AppComponent extends BaseAppComponent {
}
