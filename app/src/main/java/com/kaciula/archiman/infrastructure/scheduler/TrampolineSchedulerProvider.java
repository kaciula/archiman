package com.kaciula.archiman.infrastructure.scheduler;

import android.support.annotation.NonNull;
import com.kaciula.archiman.domain.boundary.SchedulerProvider;
import io.reactivex.Scheduler;
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
