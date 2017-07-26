package com.kaciula.archiman.injection;

import android.content.Context;
import com.kaciula.archiman.domain.util.SchedulerProvider;
import com.kaciula.archiman.infrastructure.AndroidSchedulerProvider;
import com.kaciula.archiman.infrastructure.BaseApplication;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module
public final class AppModule {

  @Provides
  @Singleton
  Context provideContext() {
    return BaseApplication.getContext();
  }

  @Provides
  @Singleton
  SchedulerProvider provideSchedulerProvider() {
    return new AndroidSchedulerProvider();
  }
}
