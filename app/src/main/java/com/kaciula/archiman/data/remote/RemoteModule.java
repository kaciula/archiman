package com.kaciula.archiman.data.remote;

import com.facebook.stetho.okhttp3.StethoInterceptor;
import com.github.simonpercic.oklog3.OkLogInterceptor;
import com.google.gson.Gson;
import com.jakewharton.retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import com.kaciula.archiman.BuildConfig;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

@Module
public class RemoteModule {

  @Provides
  @Singleton
  OkHttpClient provideOkHttpClient() {
    OkHttpClient.Builder builder = new OkHttpClient.Builder();
    if (BuildConfig.DEBUG) {
      HttpLoggingInterceptor loggingInterceptor = new HttpLoggingInterceptor();
      loggingInterceptor.setLevel(HttpLoggingInterceptor.Level.BODY);
      builder.addInterceptor(loggingInterceptor);
      OkLogInterceptor okLogInterceptor = OkLogInterceptor.builder().build();
      builder.addInterceptor(okLogInterceptor);
      StethoInterceptor stethoInterceptor = new StethoInterceptor();
      builder.addNetworkInterceptor(stethoInterceptor);
    }
    return builder.build();
  }

  @Provides
  @Singleton
  StackExchangeApi provideRetrofit(Gson gson, OkHttpClient okHttpClient) {
    return new Retrofit.Builder().addConverterFactory(GsonConverterFactory.create(gson))
        .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
        .baseUrl("https://api.stackexchange.com/2.2/").client(okHttpClient).build()
        .create(StackExchangeApi.class);
  }

  /*// always verify the host - dont check for certificate
  private static final HostnameVerifier DO_NOT_VERIFY = new HostnameVerifier() {
    public boolean verify(String hostname, SSLSession session) {
      return true;
    }
  };

  // Trust every server - don't check for any certificate
  private static SSLSocketFactory getTrustfulSocketFactory() {
    // Create a trust manager that does not validate certificate chains
    TrustManager[] trustAllCerts = new TrustManager[] {new X509TrustManager() {
      public java.security.cert.X509Certificate[] getAcceptedIssuers() {
        return new java.security.cert.X509Certificate[] {};
      }

      public void checkClientTrusted(X509Certificate[] chain, String authType)
          throws CertificateException {
      }

      public void checkServerTrusted(X509Certificate[] chain, String authType)
          throws CertificateException {
      }
    }};

    // Install the all-trusting trust manager
    try {
      SSLContext sc = SSLContext.getInstance("TLS");
      sc.init(null, trustAllCerts, new java.security.SecureRandom());
      return sc.getSocketFactory();
    } catch (Exception e) {
      Timber.w(e, e.getMessage());
    }
    return null;
  }*/
}
