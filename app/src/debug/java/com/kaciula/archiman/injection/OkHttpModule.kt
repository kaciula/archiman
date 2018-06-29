package com.kaciula.archiman.injection

import com.facebook.stetho.okhttp3.StethoInterceptor
import com.github.simonpercic.oklog3.OkLogInterceptor
import dagger.Module
import dagger.Provides
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import javax.inject.Singleton

@Module
class OkHttpModule {

    @Provides
    @Singleton
    fun provideOkHttpClient(builder: OkHttpClient.Builder): OkHttpClient {
        val loggingInterceptor = HttpLoggingInterceptor()
        loggingInterceptor.level = HttpLoggingInterceptor.Level.BODY
        builder.addInterceptor(loggingInterceptor)
        val okLogInterceptor = OkLogInterceptor.builder().build()
        builder.addInterceptor(okLogInterceptor)
        val stethoInterceptor = StethoInterceptor()
        builder.addNetworkInterceptor(stethoInterceptor)
        return builder.build()
    }
}
