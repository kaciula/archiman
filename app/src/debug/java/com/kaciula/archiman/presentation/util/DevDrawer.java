package com.kaciula.archiman.presentation.util;


import android.app.Activity;
import io.palaima.debugdrawer.DebugDrawer;
import io.palaima.debugdrawer.commons.BuildModule;
import io.palaima.debugdrawer.commons.DeviceModule;

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
            //            new ActionsModule(switchAction, buttonAction, spinnerAction),
            //              new FpsModule(Takt.stock(getApplication())),
            //              new LocationModule(this),
            //              new ScalpelModule(this),
            //              new TimberModule(),
            //              new OkHttp3Module(okHttpClient),
            //              new PicassoModule(picasso),
            //              new GlideModule(Glide.get(getContext())),
            new DeviceModule(activity),
            new BuildModule(activity)
            //              new NetworkModule(this),
            //              new SettingsModule(this)
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
}
