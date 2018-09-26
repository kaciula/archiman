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
import com.kaciula.archiman.presentation.screens.main.effecthandlers.MainEffectHandlers
import com.squareup.moshi.Moshi
import okhttp3.Cache
import okhttp3.OkHttpClient
import org.koin.dsl.module.applicationContext

val AppModule = applicationContext {
    bean { AndroidSchedulerProvider() as SchedulerProvider }
    bean { CoordinatorImpl(get()) as Coordinator }
}

val RemoteModule = applicationContext {
    bean { createOkHttpClientBuilder(get()) }
}

fun createOkHttpClientBuilder(context: Context): OkHttpClient.Builder {
    val builder = OkHttpClient.Builder()
    val cacheSizeBytes = 2 * 1024 * 1024
    builder.cache(Cache(context.cacheDir, cacheSizeBytes.toLong()))
    return builder
}

val InfrastructureModule = applicationContext {
    bean { createMoshi() }
    bean { AppRepositoryImpl() as AppRepository }
    bean { CrashlyticsCrashReporter(get()) as CrashReporter }
}

fun createMoshi(): Moshi {
    return Moshi.Builder()
        .add(MoshiLocalDateTimeAdapter())
        .add(MoshiLocalDateAdapter())
        .add(MoshiLocalTimeAdapter())
        .build()
}


val ScreensModule = applicationContext {
    context(ScreenContext.MAIN) {
        bean { params ->
            MainEffectHandlers(params[KoinParam.ACTIVITY], get(), get())
        }
    }
    context(ScreenContext.HOME) {
        bean { HomeEffectHandlers(get(), get()) }
    }
}

val archimanAppModules = listOf(
    AppModule,
    InfrastructureModule,
    RemoteModule,
    OkHttpModule,
    ScreensModule
)

object KoinParam {
    const val CONTROLLER = "CONTROLLER"
    const val ACTIVITY = "ACTIVITY"
}

object ScreenContext {
    const val MAIN = "MAIN"
    const val HOME = "HOME"
}