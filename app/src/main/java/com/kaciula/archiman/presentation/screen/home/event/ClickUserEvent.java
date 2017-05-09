package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.presentation.screen.home.UserViewModel;

@AutoValue
public abstract class ClickUserEvent extends HomeViewEvent {
  public abstract UserViewModel user();

  public static ClickUserEvent create(UserViewModel user) {
    return new AutoValue_ClickUserEvent(user);
  }
}
