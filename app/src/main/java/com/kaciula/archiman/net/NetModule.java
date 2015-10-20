package com.kaciula.archiman.net;

import android.app.Application;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.kaciula.archiman.BuildConfig;
import com.squareup.okhttp.Cache;
import com.squareup.okhttp.OkHttpClient;

import java.io.File;
import java.util.concurrent.TimeUnit;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import retrofit.RestAdapter;
import retrofit.client.OkClient;

@Module(
        complete = false,
        library = true
)
public class NetModule {

    @Provides
    @Singleton
    GithubApi provideGithubApi(OkHttpClient okHttpClient, ObjectMapper mapper) {
        RestAdapter restAdapter = new RestAdapter.Builder()
                .setEndpoint("https://api.github.com")
                .setClient(new OkClient(okHttpClient))
                .setConverter(new JacksonConverter(mapper))
                .build();
        restAdapter.setLogLevel(BuildConfig.DEBUG ? RestAdapter.LogLevel.FULL : RestAdapter
                .LogLevel.NONE);
        return restAdapter.create(GithubApi.class);
    }

    @Provides
    @Singleton
    OkHttpClient provideOkHttpClient(Application app) {
        OkHttpClient okHttpClient = new OkHttpClient();
//        okHttpClient.setSslSocketFactory(getTrustfulSocketFactory());
//        okHttpClient.setHostnameVerifier(DO_NOT_VERIFY);
        okHttpClient.setConnectTimeout(30, TimeUnit.SECONDS);
        okHttpClient.setReadTimeout(40, TimeUnit.SECONDS);
        File cacheDir = new File(app.getCacheDir(), "archiman-cache");
        if (!cacheDir.exists())
            cacheDir.mkdirs();
        Cache cache = new Cache(cacheDir, 10 * 1024 * 1024); // 10MB
        okHttpClient.setCache(cache);
        return okHttpClient;
    }

    @Provides
    @Singleton
    ObjectMapper provideMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
        return mapper;
    }

/*
    // always verify the host - dont check for certificate
    private static final HostnameVerifier DO_NOT_VERIFY = new HostnameVerifier() {
        public boolean verify(String hostname, SSLSession session) {
            return true;
        }
    };

    // Trust every server - don't check for any certificate
    private static SSLSocketFactory getTrustfulSocketFactory() {
        // Create a trust manager that does not validate certificate chains
        TrustManager[] trustAllCerts = new TrustManager[]{new X509TrustManager() {
            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                return new java.security.cert.X509Certificate[]{};
            }

            public void checkClientTrusted(X509Certificate[] chain,
                                           String authType) throws CertificateException {
            }

            public void checkServerTrusted(X509Certificate[] chain,
                                           String authType) throws CertificateException {
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
    }
*/
}
