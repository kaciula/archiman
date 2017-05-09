package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.presentation.screen.home.UserViewModel;
import com.kaciula.archiman.util.GenericResult;

@AutoValue
public abstract class ClickUserResult implements GenericResult {
  public abstract UserViewModel user();

  public static ClickUserResult create(UserViewModel user) {
    return new AutoValue_ClickUserResult(user);
  }
}
