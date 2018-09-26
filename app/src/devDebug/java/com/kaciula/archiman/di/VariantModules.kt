package com.kaciula.archiman.di

import com.facebook.stetho.okhttp3.StethoInterceptor
import com.github.simonpercic.oklog3.OkLogInterceptor
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import org.koin.dsl.module.module

val variantModule = module {
    single { createOkHttpClient(get()) }
}

fun createOkHttpClient(builder: OkHttpClient.Builder): OkHttpClient {
    val loggingInterceptor = HttpLoggingInterceptor()
    loggingInterceptor.level = HttpLoggingInterceptor.Level.BODY
    builder.addInterceptor(loggingInterceptor)
    val okLogInterceptor = OkLogInterceptor.builder().build()
    builder.addInterceptor(okLogInterceptor)
    val stethoInterceptor = StethoInterceptor()
    builder.addNetworkInterceptor(stethoInterceptor)
    return builder.build()
}