package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;

@AutoValue
public class ClickOkUserDialogEvent extends HomeViewEvent {
  public static ClickOkUserDialogEvent create() {
    return new AutoValue_ClickOkUserDialogEvent();
  }
}
