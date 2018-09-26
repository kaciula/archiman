package com.kaciula.archiman.di

import android.content.Context
import com.kaciula.archiman.domain.boundary.AppRepository
import com.kaciula.archiman.domain.boundary.CrashReporter
import com.kaciula.archiman.domain.boundary.SchedulerProvider
import com.kaciula.archiman.infrastructure.data.AppRepositoryImpl
import com.kaciula.archiman.infrastructure.data.util.moshi.MoshiLocalDateAdapter
import com.kaciula.archiman.infrastructure.data.util.moshi.MoshiLocalDateTimeAdapter
import com.kaciula.archiman.infrastructure.data.util.moshi.MoshiLocalTimeAdapter
import com.kaciula.archiman.infrastructure.util.AndroidSchedulerProvider
import com.kaciula.archiman.infrastructure.util.CrashlyticsCrashReporter
import com.kaciula.archiman.presentation.screens.home.effecthandlers.HomeEffectHandlers
import com.kaciula.archiman.presentation.screens.main.Coordinator
import com.kaciula.archiman.presentation.screens.main.CoordinatorImpl
import com.kaciula.archiman.presentation.screens.main.MainActivity
import com.kaciula.archiman.presentation.screens.main.effecthandlers.MainEffectHandlers
import com.squareup.moshi.Moshi
import okhttp3.Cache
import okhttp3.OkHttpClient
import org.koin.dsl.module.module

val appModule = module {
    single { AndroidSchedulerProvider() as SchedulerProvider }
    single { CoordinatorImpl(get()) as Coordinator }
}

val remoteModule = module {
    single { createOkHttpClientBuilder(get()) }
}

fun createOkHttpClientBuilder(context: Context): OkHttpClient.Builder {
    val builder = OkHttpClient.Builder()
    val cacheSizeBytes = 2 * 1024 * 1024
    builder.cache(Cache(context.cacheDir, cacheSizeBytes.toLong()))
    return builder
}

val infrastructureModule = module {
    single { createMoshi() }
    single { AppRepositoryImpl() as AppRepository }
    single { CrashlyticsCrashReporter(get()) as CrashReporter }
}

fun createMoshi(): Moshi {
    return Moshi.Builder()
        .add(MoshiLocalDateTimeAdapter())
        .add(MoshiLocalDateAdapter())
        .add(MoshiLocalTimeAdapter())
        .build()
}

val screensModule = module {
    factory { (activity: MainActivity) ->
        MainEffectHandlers(activity, get(), get())
    }
    factory { HomeEffectHandlers(get(), get()) }
}

val appModules =
    listOf(appModule, infrastructureModule, remoteModule, screensModule, variantModule)