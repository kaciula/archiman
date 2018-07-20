package com.kaciula.archiman.di

import okhttp3.OkHttpClient
import org.koin.dsl.module.applicationContext

val OkHttpModule = applicationContext {
    bean { createOkHttpClient(get()) }
}

fun createOkHttpClient(builder: OkHttpClient.Builder): OkHttpClient {
    return builder.build()
}