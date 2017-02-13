package com.kaciula.archiman.util.injection;

import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;
import okhttp3.OkHttpClient;

@Module
public class OkHttpModule {

  @Provides
  @Singleton
  OkHttpClient provideOkHttpClient(OkHttpClient.Builder builder) {
    return builder.build();
  }
}
