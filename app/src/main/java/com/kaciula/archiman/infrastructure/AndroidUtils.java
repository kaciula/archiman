package com.kaciula.archiman.infrastructure;

import android.content.Context;
import android.provider.Settings;
import com.kaciula.archiman.domain.util.Strings;

public class AndroidUtils {

  public static String getDeviceId() {
    Context ctx = BaseApplication.getContext();
    String deviceId =
        Settings.Secure.getString(ctx.getContentResolver(), Settings.Secure.ANDROID_ID);
    if (!Strings.INSTANCE.isBlank(deviceId)) {
      return deviceId;
    }
    return "THISISASTATICID";
  }

  public static String getInstaller() {
    Context ctx = BaseApplication.getContext();
    String installer = ctx.getPackageManager().getInstallerPackageName(ctx.getPackageName());
    if ("com.android.vending".equals(installer) || "com.google.android.feedback"
        .equals(installer)) {
      return "Google Play Store";
    }
    if ("com.amazon.venezia".equals(installer)) {
      return "Amazon App Store";
    }
    if (installer == null) {
      return "No store info";
    }
    return installer;
  }
}
