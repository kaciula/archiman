package com.kaciula.archiman.util;

import android.content.Context;
import android.provider.Settings;

import com.kaciula.archiman.component.BaseApplication;

public class MiscUtils {

    public static String getDeviceId() {
        Context ctx = BaseApplication.getContext();
        String deviceId = Settings.Secure.getString(ctx.getContentResolver(), Settings.Secure
                .ANDROID_ID);
        if (!Strings.isBlank(deviceId))
            return deviceId;
        return "THISISASTATICID";
    }

    public static String getInstaller() {
        Context ctx = BaseApplication.getContext();
        String installer = ctx.getPackageManager().getInstallerPackageName(ctx.getPackageName());
        if ("com.android.vending".equals(installer) || "com.google.android.feedback".equals
                (installer))
            return "Google Play Store";
        if ("com.amazon.venezia".equals(installer))
            return "Amazon App Store";
        if (installer == null)
            return "No store info";
        return installer;
    }
}
