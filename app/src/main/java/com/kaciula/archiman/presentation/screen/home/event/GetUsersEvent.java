package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;

@AutoValue
public abstract class GetUsersEvent extends HomeViewEvent {
  public static GetUsersEvent create() {
    return new AutoValue_GetUsersEvent();
  }
}
