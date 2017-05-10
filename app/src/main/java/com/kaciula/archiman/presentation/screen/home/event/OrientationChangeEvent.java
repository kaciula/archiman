package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;

@AutoValue
public abstract class OrientationChangeEvent extends HomeViewEvent {
  public static OrientationChangeEvent create() {
    return new AutoValue_OrientationChangeEvent();
  }
}
