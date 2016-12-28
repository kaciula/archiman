package com.kaciula.archiman.presentation.screen.main;

import com.google.auto.value.AutoValue;
import java.util.List;

@AutoValue
public abstract class MainViewModel {
  public abstract List<UserViewModel> users();

  public static MainViewModel create(List<UserViewModel> users) {
    return new AutoValue_MainViewModel(users);
  }
}
