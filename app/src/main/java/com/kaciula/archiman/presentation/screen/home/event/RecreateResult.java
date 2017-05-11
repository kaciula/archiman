package com.kaciula.archiman.presentation.screen.home.event;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.util.GenericResult;

@AutoValue
public class RecreateResult implements GenericResult {
  public static RecreateResult create() {
    return new AutoValue_RecreateResult();
  }
}
