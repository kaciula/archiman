package com.kaciula.archiman.domain.util;

import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;

/**
 * Allow providing different types of {@link Scheduler}s.
 */
public interface SchedulerProvider {

  @NonNull
  Scheduler computation();

  @NonNull
  Scheduler io();

  @NonNull
  Scheduler ui();
}