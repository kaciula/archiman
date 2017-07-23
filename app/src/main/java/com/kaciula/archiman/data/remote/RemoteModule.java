package com.kaciula.archiman.data.remote;

import android.content.Context;
import com.google.gson.Gson;
import com.kaciula.archiman.injection.OkHttpModule;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;
import okhttp3.Cache;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

@Module(includes = OkHttpModule.class)
public class RemoteModule {

  @Provides
  @Singleton
  OkHttpClient.Builder provideOkHttpClientBuilder(Context context) {
    OkHttpClient.Builder builder = new OkHttpClient.Builder();
    final int CACHE_SIZE_BYTES = 2 * 1024 * 1024;
    builder.cache(new Cache(context.getCacheDir(), CACHE_SIZE_BYTES));
    return builder;
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
