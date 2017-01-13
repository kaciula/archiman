package com.kaciula.archiman.presentation.util;

import android.os.Bundle;
import android.support.annotation.NonNull;
import com.bluelinelabs.conductor.ControllerChangeHandler;
import com.bluelinelabs.conductor.ControllerChangeType;
import com.kaciula.archiman.infrastructure.ArchimanApplication;

public abstract class RefWatchingController extends ButterKnifeController {

  protected RefWatchingController() {
  }

  protected RefWatchingController(Bundle args) {
    super(args);
  }

  private boolean hasExited;

  @Override
  public void onDestroy() {
    super.onDestroy();

    if (hasExited) {
      ArchimanApplication.refWatcher.watch(this);
    }
  }

  @Override
  protected void onChangeEnded(@NonNull ControllerChangeHandler changeHandler, @NonNull
      ControllerChangeType changeType) {
    super.onChangeEnded(changeHandler, changeType);

    hasExited = !changeType.isEnter;
    if (isDestroyed()) {
      ArchimanApplication.refWatcher.watch(this);
    }
  }
}
