package com.kaciula.archiman.infrastructure;

import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.domain.usecase.InitColdStartUsecase;
import com.kaciula.archiman.util.injection.AppComponent;
import com.kaciula.archiman.util.injection.AppModule;
import com.kaciula.archiman.util.injection.DaggerAppComponent;
import com.squareup.leakcanary.LeakCanary;
import io.fabric.sdk.android.Fabric;
import javax.inject.Inject;
import timber.log.Timber;

public class ArchimanApplication extends BaseApplication {

  private AppComponent appComponent;

  @Inject InitColdStartUsecase initColdStartUsecase;

  @Override
  public void onCreate() {
    super.onCreate();

    if (BuildConfig.DEBUG) {
      Timber.plant(new Timber.DebugTree());
      LeakCanary.install(this);
    } else {
      startCrashlytics();
      Timber.plant(new CrashlyticsTree());
    }

    appComponent = DaggerAppComponent.builder().appModule(new AppModule()).build();
    appComponent.inject(this);

    initColdStartUsecase
        .execute(InitColdStartUsecase.RequestValues.create(BuildConfig.VERSION_CODE)).subscribe();
  }

  public static AppComponent component() {
    return ((ArchimanApplication) getContext()).appComponent;
  }

  public void startCrashlytics() {
    Fabric.with(this, new Crashlytics());
    Crashlytics.setUserIdentifier(MiscUtils.getDeviceId());
    Crashlytics.setString("Installer", MiscUtils.getInstaller());
    Crashlytics.setString("Git SHA", BuildConfig.GIT_SHA);
  }
}
