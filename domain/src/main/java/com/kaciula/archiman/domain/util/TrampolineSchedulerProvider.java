package com.kaciula.archiman.domain.util;

import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;
import io.reactivex.schedulers.Schedulers;

/**
 * Implementation of the {@link SchedulerProvider} making all {@link Scheduler}s trampoline.
 */
public class TrampolineSchedulerProvider implements SchedulerProvider {

  @NonNull
  @Override
  public Scheduler computation() {
    return Schedulers.trampoline();
  }

  @NonNull
  @Override
  public Scheduler io() {
    return Schedulers.trampoline();
  }

  @NonNull
  @Override
  public Scheduler ui() {
    return Schedulers.trampoline();
  }
}
