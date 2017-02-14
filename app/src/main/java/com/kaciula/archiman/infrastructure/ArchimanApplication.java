package com.kaciula.archiman.infrastructure;

import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.domain.usecase.InitColdStart;
import com.kaciula.archiman.util.injection.AppComponent;
import com.kaciula.archiman.util.injection.AppModule;
import com.kaciula.archiman.util.injection.DaggerAppComponent;
import io.realm.Realm;
import io.realm.RealmConfiguration;
import javax.inject.Inject;

public class ArchimanApplication extends BaseApplication {

  private AppComponent appComponent;

  @Inject InitColdStart initColdStart;

  @Override
  public void onCreate() {
    super.onCreate();

    appComponent = DaggerAppComponent.builder().appModule(new AppModule()).build();
    appComponent.inject(this);

    setupRealm();

    initColdStart
        .execute(InitColdStart.RequestModel.create(BuildConfig.VERSION_CODE))
        .subscribe();
  }

  public static AppComponent component() {
    return ((ArchimanApplication) getContext()).appComponent;
  }

  public static ArchimanApplication get() {
    return (ArchimanApplication) getContext();
  }

  public boolean isCrashlyticsUsed() {
    return false;
  }

  private void setupRealm() {
    Realm.init(this);
    RealmConfiguration realmConfiguration = new RealmConfiguration.Builder().build();
    Realm.setDefaultConfiguration(realmConfiguration);
  }
}
