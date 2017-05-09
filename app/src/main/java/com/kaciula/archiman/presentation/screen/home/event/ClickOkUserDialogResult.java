package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.util.GenericResult;

@AutoValue
public abstract class ClickOkUserDialogResult implements GenericResult {

  public static ClickOkUserDialogResult create() {
    return new AutoValue_ClickOkUserDialogResult();
  }
}
