package com.kaciula.archiman.injection

import android.content.Context
import com.kaciula.archiman.infrastructure.data.remote.StackExchangeApi
import com.squareup.moshi.Moshi
import dagger.Module
import dagger.Provides
import okhttp3.Cache
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.moshi.MoshiConverterFactory
import javax.inject.Singleton

@Module(includes = arrayOf(OkHttpModule::class))
class RemoteModule {

    @Provides
    @Singleton
    fun provideOkHttpClientBuilder(context: Context): OkHttpClient.Builder {
        val builder = OkHttpClient.Builder()
        val cacheSizeBytes = 2 * 1024 * 1024
        builder.cache(Cache(context.cacheDir, cacheSizeBytes.toLong()))
        return builder
    }

    @Provides
    @Singleton
    fun provideRetrofit(moshi: Moshi, okHttpClient: OkHttpClient): StackExchangeApi {
        return Retrofit.Builder().addConverterFactory(MoshiConverterFactory.create(moshi))
                .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                .baseUrl("https://api.stackexchange.com/2.2/").client(okHttpClient).build()
                .create(StackExchangeApi::class.java)
    }
}
