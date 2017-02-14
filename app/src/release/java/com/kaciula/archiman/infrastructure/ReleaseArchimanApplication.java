package com.kaciula.archiman.infrastructure;

import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.BuildConfig;
import io.fabric.sdk.android.Fabric;
import timber.log.Timber;

public class ReleaseArchimanApplication extends ArchimanApplication {

  @Override
  public void onCreate() {
    super.onCreate();

    Thread.UncaughtExceptionHandler uncaughtExceptionHandler =
        new ArchimanUncaughtExceptionHandler(getContext());
    Thread.setDefaultUncaughtExceptionHandler(uncaughtExceptionHandler);

    if (isCrashlyticsUsed()) {
      startCrashlytics();
      Timber.plant(new CrashlyticsTree());
    }
  }

  @Override
  public boolean isCrashlyticsUsed() {
    // FIXME: 10/01/17 When you have set the fabric API key, replace this with true
    return false;
  }

  private void startCrashlytics() {
    Fabric.with(this, new Crashlytics());
    Crashlytics.setUserIdentifier(AndroidUtils.getDeviceId());
    Crashlytics.setString("Installer", AndroidUtils.getInstaller());
    Crashlytics.setString("Git SHA", BuildConfig.GIT_SHA);
  }
}
