package com.kaciula.archiman.util;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.os.StrictMode;
import net.danlew.android.joda.JodaTimeAndroid;

public abstract class BaseApplication extends Application {

  @SuppressLint("StaticFieldLeak") private static Context context;

  /* Get the context when you don't have access to it in any other way */
  public static Context getContext() {
    return context;
  }

  @Override
  public void onCreate() {
    super.onCreate();

    BaseApplication.context = getApplicationContext();
    JodaTimeAndroid.init(this);
  }

  /*
   * When in developer mode, we use StrictMode (if available) to detect accidental
   * disk/network access on the application's main thread
   */
  protected void enableFullStrictMode() {
    StrictMode
        .setThreadPolicy(new StrictMode.ThreadPolicy.Builder().detectAll().penaltyLog().build());
    StrictMode.setVmPolicy(new StrictMode.VmPolicy.Builder().detectAll().penaltyLog().build());
  }

  protected void enableFullStrictModePenaltyDeath() {
    StrictMode
        .setThreadPolicy(new StrictMode.ThreadPolicy.Builder().detectAll().penaltyDeath().build());
    StrictMode.setVmPolicy(new StrictMode.VmPolicy.Builder().detectAll().penaltyDeath().build());
  }

  protected void allowThreadDiskReads() {
    StrictMode.allowThreadDiskReads();
  }

  protected void allowThreadDiskWrites() {
    StrictMode.allowThreadDiskWrites();
  }
}
