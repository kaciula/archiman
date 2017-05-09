package com.kaciula.archiman.presentation.screen.home;

import com.google.auto.value.AutoValue;
import io.reactivex.annotations.Nullable;
import java.util.List;

@AutoValue
public abstract class HomeViewModel {

  public abstract boolean isInitial();

  public abstract boolean isProgress();

  @Nullable
  public abstract List<UserViewModel> users();

  public abstract boolean isError();

  public abstract boolean showUserDialog();

  @Nullable
  public abstract UserViewModel dialogUser();

  public static Builder builder() {
    return new AutoValue_HomeViewModel.Builder();
  }

  static HomeViewModel initial() {
    return builder()
        .isInitial(true)
        .isProgress(false)
        .users(null)
        .isError(false)
        .showUserDialog(false)
        .dialogUser(null)
        .build();
  }

  static HomeViewModel progress() {
    return builder()
        .isInitial(false)
        .isProgress(true)
        .users(null)
        .isError(false)
        .showUserDialog(false)
        .dialogUser(null)
        .build();
  }

  static HomeViewModel content(List<UserViewModel> users) {
    return builder()
        .isInitial(false)
        .isProgress(false)
        .users(users)
        .isError(false)
        .showUserDialog(false)
        .dialogUser(null)
        .build();
  }

  static HomeViewModel error() {
    return builder()
        .isInitial(false)
        .isProgress(false)
        .users(null)
        .isError(true)
        .showUserDialog(false)
        .dialogUser(null)
        .build();
  }

  static HomeViewModel contentWithDialog(UserViewModel user) {
    return builder()
        .isInitial(false)
        .isProgress(false)
        .users(null)
        .isError(false)
        .showUserDialog(true)
        .dialogUser(user)
        .build();
  }

  abstract Builder toBuilder();

  @AutoValue.Builder
  public abstract static class Builder {
    public abstract Builder isInitial(boolean isInitial);

    public abstract Builder isProgress(boolean isProgress);

    public abstract Builder users(List<UserViewModel> users);

    public abstract Builder isError(boolean isError);

    public abstract Builder showUserDialog(boolean showUserDialog);

    public abstract Builder dialogUser(UserViewModel dialogUser);

    public abstract HomeViewModel build();
  }
}
