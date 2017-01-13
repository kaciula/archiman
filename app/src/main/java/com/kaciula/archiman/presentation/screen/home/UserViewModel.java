package com.kaciula.archiman.presentation.screen.home;

import android.os.Parcelable;
import com.google.auto.value.AutoValue;

@AutoValue
public abstract class UserViewModel implements Parcelable {
  public abstract String name();

  public static UserViewModel create(String name) {
    return new AutoValue_UserViewModel(name);
  }
}
