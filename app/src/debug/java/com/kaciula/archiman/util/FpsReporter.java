package com.kaciula.archiman.util;

import android.app.Application;
import jp.wasabeef.takt.Takt;

public class FpsReporter {

  public static void start(Application application) {
    Takt.stock(application).play();
  }

  public static void end() {
    Takt.finish();
  }
}
