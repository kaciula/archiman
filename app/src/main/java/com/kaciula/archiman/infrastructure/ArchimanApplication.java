package com.kaciula.archiman.infrastructure;

import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.domain.usecase.InitColdStart;
import com.kaciula.archiman.presentation.util.DevDrawer;
import com.kaciula.archiman.util.FpsReporter;
import com.kaciula.archiman.util.injection.AppComponent;
import com.kaciula.archiman.util.injection.AppModule;
import com.kaciula.archiman.util.injection.DaggerAppComponent;
import com.squareup.leakcanary.LeakCanary;
import com.squareup.leakcanary.RefWatcher;
import io.fabric.sdk.android.Fabric;
import io.realm.Realm;
import io.realm.RealmConfiguration;
import javax.inject.Inject;
import timber.log.Timber;

public class ArchimanApplication extends BaseApplication {

  private AppComponent appComponent;
  public static RefWatcher refWatcher;

  @Inject InitColdStart initColdStart;

  @Override
  public void onCreate() {
    super.onCreate();

    if (BuildConfig.DEBUG) {
      Timber.plant(new Timber.DebugTree());
      DevDrawer.setupLogging();
      refWatcher = LeakCanary.install(this);
      FpsReporter.start(this);
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

    setupRealm();

    initColdStart
        .execute(InitColdStart.RequestModel.create(BuildConfig.VERSION_CODE))
        .subscribe();
  }

  @Override
  public void onTerminate() {
    if (BuildConfig.DEBUG) {
      FpsReporter.end();
    }
    super.onTerminate();
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

  private void setupRealm() {
    Realm.init(this);
    RealmConfiguration realmConfiguration = new RealmConfiguration.Builder().build();
    Realm.setDefaultConfiguration(realmConfiguration);
  }
}
