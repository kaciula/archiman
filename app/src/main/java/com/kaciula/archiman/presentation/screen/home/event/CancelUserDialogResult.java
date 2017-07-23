package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.domain.util.GenericResult;

@AutoValue
public abstract class CancelUserDialogResult implements GenericResult {

  public static CancelUserDialogResult create() {
    return new AutoValue_CancelUserDialogResult();
  }
}
