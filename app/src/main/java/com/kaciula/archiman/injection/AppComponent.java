package com.kaciula.archiman.injection;

import com.kaciula.archiman.data.AppInfoRepositoryImpl;
import com.kaciula.archiman.data.DataModule;
import com.kaciula.archiman.data.DataRepositoryModule;
import com.kaciula.archiman.data.local.prefs.PrefsModule;
import com.kaciula.archiman.data.remote.RemoteModule;
import com.kaciula.archiman.domain.util.DomainModule;
import dagger.Component;
import javax.inject.Singleton;

@Singleton
@Component(modules = {AppModule.class, DataModule.class, PrefsModule.class, RemoteModule.class,
    DataRepositoryModule.class, DomainModule.class})
public interface AppComponent extends BaseAppComponent {

  void inject(AppInfoRepositoryImpl prefsRepository);
}
