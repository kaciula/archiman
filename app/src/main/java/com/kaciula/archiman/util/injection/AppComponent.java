package com.kaciula.archiman.util.injection;

import com.kaciula.archiman.data.DataModule;
import com.kaciula.archiman.data.DataRepositoryModule;
import com.kaciula.archiman.data.local.prefs.PrefsDataRepository;
import com.kaciula.archiman.data.local.prefs.PrefsModule;
import com.kaciula.archiman.data.remote.RemoteModule;
import com.kaciula.archiman.domain.util.UseCaseModule;
import dagger.Component;
import javax.inject.Singleton;

@Singleton
@Component(modules = {AppModule.class, DataModule.class, PrefsModule.class, RemoteModule.class,
    DataRepositoryModule.class, UseCaseModule.class})
public interface AppComponent extends BaseAppComponent {

  void inject(PrefsDataRepository prefsRepository);
}
