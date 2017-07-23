package com.kaciula.archiman.infrastructure.scheduler;

import android.support.annotation.NonNull;
import com.kaciula.archiman.domain.boundary.SchedulerProvider;
import io.reactivex.Scheduler;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.schedulers.Schedulers;

public class AndroidSchedulerProvider implements SchedulerProvider {

  @Override
  @NonNull
  public Scheduler computation() {
    return Schedulers.computation();
  }

  @Override
  @NonNull
  public Scheduler io() {
    return Schedulers.io();
  }

  @Override
  @NonNull
  public Scheduler ui() {
    return AndroidSchedulers.mainThread();
  }
}