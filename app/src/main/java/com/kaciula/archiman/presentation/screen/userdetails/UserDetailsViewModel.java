package com.kaciula.archiman.presentation.screen.userdetails;

import com.google.auto.value.AutoValue;

@AutoValue
abstract class UserDetailsViewModel {

  abstract String userName();

  public static UserDetailsViewModel create(String userName) {
    return new AutoValue_UserDetailsViewModel(userName);
  }
}
