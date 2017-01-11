package com.kaciula.archiman.infrastructure;

import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.domain.usecase.InitColdStart;
import com.kaciula.archiman.util.injection.AppComponent;
import com.kaciula.archiman.util.injection.AppModule;
import com.kaciula.archiman.util.injection.DaggerAppComponent;
import com.squareup.leakcanary.LeakCanary;
import io.fabric.sdk.android.Fabric;
import javax.inject.Inject;
import timber.log.Timber;

public class ArchimanApplication extends BaseApplication {

  private AppComponent appComponent;

  @Inject InitColdStart initColdStart;

  @Override
  public void onCreate() {
    super.onCreate();

    if (BuildConfig.DEBUG) {
      Timber.plant(new Timber.DebugTree());
      LeakCanary.install(this);
    } else {
      Thread.UncaughtExceptionHandler uncaughtExceptionHandler =
          new ArchimanUncaughtExceptionHandler(getContext());
      Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler);

      if (isCrashlyticsUsed()) {
        startCrashlytics();
        Timber.plant(new CrashlyticsTree());
      }
    }

    appComponent = DaggerAppComponent.builder().appModule(new AppModule()).build();
    appComponent.inject(this);

    initColdStart
        .execute(InitColdStart.RequestModel.create(BuildConfig.VERSION_CODE))
        .subscribe();
  }

  public static AppComponent component() {
    return ((ArchimanApplication) getContext()).appComponent;
  }

  public static boolean isCrashlyticsUsed() {
    // FIXME: 10/01/17 When you have set the fabric API key, replace this with BuildConfig.BUILD
    return false;
  }

  private void startCrashlytics() {
    Fabric.with(this, new Crashlytics());
    Crashlytics.setUserIdentifier(AndroidUtils.getDeviceId());
    Crashlytics.setString("Installer", AndroidUtils.getInstaller());
    Crashlytics.setString("Git SHA", BuildConfig.GIT_SHA);
  }
}
