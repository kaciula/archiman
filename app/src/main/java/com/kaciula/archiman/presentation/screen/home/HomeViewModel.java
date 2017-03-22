package com.kaciula.archiman.presentation.screen.home;

import com.google.auto.value.AutoValue;
import java.util.List;

interface HomeViewModel {

  @AutoValue
  abstract class Initial implements HomeViewModel {
    public static Initial create() {
      return new AutoValue_HomeViewModel_Initial();
    }
  }


  @AutoValue
  abstract class Progress implements HomeViewModel {
    public static Progress create() {
      return new AutoValue_HomeViewModel_Progress();
    }
  }


  @AutoValue
  abstract class Content implements HomeViewModel {
    public abstract List<UserViewModel> users();

    public static HomeViewModel create(List<UserViewModel> users) {
      return new AutoValue_HomeViewModel_Content(users);
    }
  }


  @AutoValue
  abstract class Error implements HomeViewModel {
    public static Error create() {
      return new AutoValue_HomeViewModel_Error();
    }
  }
}
