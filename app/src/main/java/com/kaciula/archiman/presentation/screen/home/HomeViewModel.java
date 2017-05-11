package com.kaciula.archiman.presentation.screen.home;

import com.google.auto.value.AutoValue;
import io.reactivex.annotations.Nullable;
import java.util.List;

@AutoValue
abstract class HomeViewModel {

  public abstract boolean initialize();

  public abstract boolean isProgress();

  public abstract boolean isContent();

  @Nullable
  public abstract List<UserViewModel> users();

  public abstract boolean isError();

  public abstract boolean showUserDialog();

  @Nullable
  public abstract UserViewModel dialogUser();

  public abstract boolean isOrientationChange();

  public static Builder builder() {
    return new AutoValue_HomeViewModel.Builder();
  }

  static HomeViewModel justInitialize() {
    return builder()
        .initialize(true)
        .isProgress(false)
        .isContent(false)
        .users(null)
        .isError(false)
        .showUserDialog(false)
        .dialogUser(null)
        .isOrientationChange(false)
        .build();
  }

  static HomeViewModel progress() {
    return builder()
        .initialize(false)
        .isProgress(true)
        .isContent(false)
        .users(null)
        .isError(false)
        .showUserDialog(false)
        .dialogUser(null)
        .isOrientationChange(false)
        .build();
  }

  static HomeViewModel content(List<UserViewModel> users) {
    return builder()
        .initialize(false)
        .isProgress(false)
        .isContent(true)
        .users(users)
        .isError(false)
        .showUserDialog(false)
        .dialogUser(null)
        .isOrientationChange(false)
        .build();
  }

  static HomeViewModel error() {
    return builder()
        .initialize(false)
        .isProgress(false)
        .isContent(false)
        .users(null)
        .isError(true)
        .showUserDialog(false)
        .dialogUser(null)
        .isOrientationChange(false)
        .build();
  }

  abstract Builder toBuilder();

  @AutoValue.Builder
  public abstract static class Builder {
    public abstract Builder initialize(boolean initialize);

    public abstract Builder isProgress(boolean isProgress);

    public abstract Builder isContent(boolean isContent);

    public abstract Builder users(List<UserViewModel> users);

    public abstract Builder isError(boolean isError);

    public abstract Builder showUserDialog(boolean showUserDialog);

    public abstract Builder dialogUser(UserViewModel dialogUser);

    public abstract Builder isOrientationChange(boolean isOrientationChange);

    public abstract HomeViewModel build();
  }
}
