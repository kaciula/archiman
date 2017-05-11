package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;

/* This event is triggered whenever there is an orientation change or we're coming back to this
screen */
@AutoValue
public abstract class RecreateEvent extends HomeViewEvent {
  public static RecreateEvent create() {
    return new AutoValue_RecreateEvent();
  }
}
