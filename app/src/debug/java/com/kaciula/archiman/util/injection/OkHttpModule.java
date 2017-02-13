package com.kaciula.archiman.util.injection;

import com.facebook.stetho.okhttp3.StethoInterceptor;
import com.github.simonpercic.oklog3.OkLogInterceptor;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;

@Module
public class OkHttpModule {

  @Provides
  @Singleton
  OkHttpClient provideOkHttpClient(OkHttpClient.Builder builder) {
    HttpLoggingInterceptor loggingInterceptor = new HttpLoggingInterceptor();
    loggingInterceptor.setLevel(HttpLoggingInterceptor.Level.BODY);
    builder.addInterceptor(loggingInterceptor);
    OkLogInterceptor okLogInterceptor = OkLogInterceptor.builder().build();
    builder.addInterceptor(okLogInterceptor);
    StethoInterceptor stethoInterceptor = new StethoInterceptor();
    builder.addNetworkInterceptor(stethoInterceptor);
    return builder.build();
  }
}
