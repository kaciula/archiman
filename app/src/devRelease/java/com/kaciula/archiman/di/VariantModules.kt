package com.kaciula.archiman.di

import okhttp3.OkHttpClient
import org.koin.dsl.module.module

val variantModule = module {
    single { createOkHttpClient(get()) }
}

fun createOkHttpClient(builder: OkHttpClient.Builder): OkHttpClient {
    return builder.build()
}