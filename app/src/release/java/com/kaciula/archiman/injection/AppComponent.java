package com.kaciula.archiman.injection;

import com.kaciula.archiman.data.DataModule;
import com.kaciula.archiman.data.local.PrefsModule;
import com.kaciula.archiman.data.remote.RemoteModule;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(modules = {AppModule.class, DataModule.class, PrefsModule.class, RemoteModule.class})
public interface AppComponent extends BaseAppComponent {
}
