package com.kaciula.archiman.infrastructure;

import com.facebook.stetho.Stetho;
import com.facebook.stetho.timber.StethoTree;
import com.kaciula.archiman.presentation.util.DevDrawer;
import com.squareup.leakcanary.LeakCanary;
import jp.wasabeef.takt.Takt;
import timber.log.Timber;

public class DebugArchimanApplication extends ArchimanApplication {

  @Override
  public void onCreate() {
    super.onCreate();
    if (LeakCanary.isInAnalyzerProcess(this)) {
      return;
    }

    Timber.plant(new Timber.DebugTree());
    DevDrawer.setupLogging();
    LeakCanary.install(this);
    Takt.stock(this).play();
    Stetho.initializeWithDefaults(this);
    Timber.plant(new StethoTree());
  }

  @Override
  public void onTerminate() {
    Takt.finish();
    super.onTerminate();
  }
}
