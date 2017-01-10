package com.kaciula.archiman.presentation.util;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import com.crashlytics.android.Crashlytics;
import com.kaciula.archiman.infrastructure.ArchimanApplication;

public abstract class ArchimanActivity extends AppCompatActivity {

  private boolean wasCalledSaveInstanceState = false;

  @Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    if (ArchimanApplication.isCrashlyticsUsed()) {
      Crashlytics.setString("current screen", getLocalClassName());
    }
  }

  @Override
  protected void onSaveInstanceState(Bundle outState) {
    super.onSaveInstanceState(outState);
    wasCalledSaveInstanceState = true;
  }

  @Override
  protected void onResume() {
    super.onResume();
    wasCalledSaveInstanceState = false;
  }

  @Override
  public boolean onOptionsItemSelected(MenuItem item) {
    int id = item.getItemId();
    if (id == android.R.id.home) {
      finish();
      return true;
    }
    return super.onOptionsItemSelected(item);
  }

  public boolean canShowDialogs() {
    return !wasCalledSaveInstanceState;
  }
}
