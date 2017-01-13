package com.kaciula.archiman.presentation.util;

import android.app.Activity;
import com.kaciula.archiman.infrastructure.BaseApplication;
import com.kaciula.archiman.util.log.LumberYard;
import com.kaciula.archiman.util.log.TimberModule;
import io.palaima.debugdrawer.DebugDrawer;
import io.palaima.debugdrawer.commons.BuildModule;
import io.palaima.debugdrawer.commons.DeviceModule;
import timber.log.Timber;

public class DevDrawer {

  private DebugDrawer debugDrawer;

  public DevDrawer(final Activity activity) {
    /*SwitchAction switchAction = new SwitchAction("Test switch", new SwitchAction.Listener() {
      @Override
      public void onCheckedChanged(boolean value) {
        Toast.makeText(activity, "Switch checked", Toast.LENGTH_LONG).show();
      }
    });

    ButtonAction buttonAction = new ButtonAction("Test button", new ButtonAction.Listener() {
      @Override
      public void onClick() {
        Toast.makeText(activity, "Button clicked", Toast.LENGTH_LONG).show();
      }
    });

    SpinnerAction<String> spinnerAction = new SpinnerAction<>(
        Arrays.asList("First", "Second", "Third"),
        new SpinnerAction.OnItemSelectedListener<String>() {
          @Override
          public void onItemSelected(String value) {
            Toast.makeText(activity, "Spinner item selected - " + value,
                Toast.LENGTH_LONG).show();
          }
        }
    );*/

    debugDrawer = new DebugDrawer.Builder(activity)
        .modules(
            new TimberModule(),
            new DeviceModule(activity),
            new BuildModule(activity)
        )
        .build();
  }

  public void onStart() {
    debugDrawer.onStart();
  }

  public void onResume() {
    debugDrawer.onResume();
  }

  public void onPause() {
    debugDrawer.onPause();
  }

  public void onStop() {
    debugDrawer.onStop();
  }

  public static void setupLogging() {
    LumberYard lumberYard = LumberYard.getInstance(BaseApplication.getContext());
    lumberYard.cleanUp();
    Timber.plant(lumberYard.tree());
  }
}
