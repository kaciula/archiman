package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.util.GenericResult;

@AutoValue
public class OrientationChangeResult implements GenericResult {
  public static OrientationChangeResult create() {
    return new AutoValue_OrientationChangeResult();
  }
}
