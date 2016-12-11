package com.kaciula.archiman;


import static android.support.test.InstrumentationRegistry.getInstrumentation;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import org.joda.time.DateTimeConstants;

public class TestUtils {

  public static void rotateToLandscape(Activity activity) {
    activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
    getInstrumentation().waitForIdleSync();
    try {
      Thread.sleep(3 * DateTimeConstants.MILLIS_PER_SECOND);
    } catch (InterruptedException ignored) {
    }
  }

  public static void rotateToPortrait(Activity activity) {
    activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
    getInstrumentation().waitForIdleSync();
    try {
      Thread.sleep(3 * DateTimeConstants.MILLIS_PER_SECOND);
    } catch (InterruptedException ignored) {
    }
  }

  public static void rotateOrientation(Activity activity) {
    int currentOrientation = activity.getResources().getConfiguration().orientation;

    switch (currentOrientation) {
      case Configuration.ORIENTATION_LANDSCAPE:
        rotateToPortrait(activity);
        break;
      case Configuration.ORIENTATION_PORTRAIT:
        rotateToLandscape(activity);
        break;
      default:
        rotateToLandscape(activity);
    }
  }
}
