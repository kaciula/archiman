package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;

@AutoValue
public abstract class CancelUserDialogEvent extends HomeViewEvent {
  public static CancelUserDialogEvent create() {
    return new AutoValue_CancelUserDialogEvent();
  }
}
