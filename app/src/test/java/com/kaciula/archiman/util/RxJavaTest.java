package com.kaciula.archiman.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kaciula.archiman.data.remote.StackExchangeApi;
import com.kaciula.archiman.data.remote.response.UsersRemote;
import com.kaciula.archiman.data.util.gson.ApiGsonAdapterFactory;
import com.kaciula.archiman.data.util.gson.GsonIntegerTypeAdapter;
import com.kaciula.archiman.data.util.gson.GsonLocalDateAdapter;
import com.kaciula.archiman.data.util.gson.GsonLocalDateTimeAdapter;
import com.kaciula.archiman.data.util.gson.GsonLocalTimeAdapter;
import com.kaciula.archiman.data.util.gson.GsonLongTypeAdapter;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.observers.DisposableObserver;
import io.reactivex.schedulers.Schedulers;
import java.util.concurrent.CountDownLatch;
import okhttp3.OkHttpClient;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.joda.time.LocalTime;
import org.junit.Before;
import org.junit.Test;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

public class RxJavaTest {

  private StackExchangeApi api;

  @Before
  public void setUp() throws Exception {
    api = provideApi();
  }

  private StackExchangeApi provideApi() {
    return new Retrofit.Builder().addConverterFactory(GsonConverterFactory.create(provideGson()))
        .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
        .baseUrl("https://api.stackexchange.com/2.2/").client(new OkHttpClient.Builder().build())
        .build()
        .create(StackExchangeApi.class);
  }

  private Gson provideGson() {
    GsonBuilder gsonBuilder = new GsonBuilder();

    gsonBuilder.registerTypeAdapter(LocalDateTime.class, new GsonLocalDateTimeAdapter());
    gsonBuilder.registerTypeAdapter(LocalDate.class, new GsonLocalDateAdapter());
    gsonBuilder.registerTypeAdapter(LocalTime.class, new GsonLocalTimeAdapter());

    GsonLongTypeAdapter gsonLongTypeAdapter = new GsonLongTypeAdapter();
    GsonIntegerTypeAdapter gsonIntegerTypeAdapter = new GsonIntegerTypeAdapter();
    gsonBuilder.registerTypeAdapter(long.class, gsonLongTypeAdapter);
    gsonBuilder.registerTypeAdapter(Long.class, gsonLongTypeAdapter);
    gsonBuilder.registerTypeAdapter(int.class, gsonIntegerTypeAdapter);
    gsonBuilder.registerTypeAdapter(Integer.class, gsonIntegerTypeAdapter);

    gsonBuilder.registerTypeAdapterFactory(ApiGsonAdapterFactory.create());
    return gsonBuilder.create();
  }

  @Test
  public void unsubscribeCancelsObservable() throws Exception {
    CompositeDisposable disposables = new CompositeDisposable();

    final CountDownLatch latch = new CountDownLatch(1);

    Disposable disposable = api.getUsers()
        .subscribeOn(Schedulers.io())
        .observeOn(Schedulers.io())
        .subscribeWith(new DisposableObserver<UsersRemote>() {
          @Override
          public void onNext(UsersRemote value) {
          }

          @Override
          public void onError(Throwable e) {
            latch.countDown();
          }

          @Override
          public void onComplete() {
            latch.countDown();
          }
        });
    disposables.add(disposable);

    disposables.dispose();
    //    latch.await();
  }
}
