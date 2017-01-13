package com.kaciula.archiman.presentation.screen.home;

import com.google.auto.value.AutoValue;
import java.util.List;

@AutoValue
abstract class HomeViewModel {
  public abstract List<UserViewModel> users();

  public static HomeViewModel create(List<UserViewModel> users) {
    return new AutoValue_HomeViewModel(users);
  }
}
