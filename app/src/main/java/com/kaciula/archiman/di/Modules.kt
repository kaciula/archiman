package com.kaciula.archiman.di

import android.content.Context
import com.kaciula.archiman.domain.boundary.*
import com.kaciula.archiman.infrastructure.data.AppRepositoryImpl
import com.kaciula.archiman.infrastructure.data.UserRepositoryImpl
import com.kaciula.archiman.infrastructure.data.local.database.UserLocalDataStore
import com.kaciula.archiman.infrastructure.data.local.system.LocationProviderImpl
import com.kaciula.archiman.infrastructure.data.remote.StackExchangeApi
import com.kaciula.archiman.infrastructure.data.remote.UserRemoteDataStore
import com.kaciula.archiman.infrastructure.data.util.moshi.MoshiLocalDateAdapter
import com.kaciula.archiman.infrastructure.data.util.moshi.MoshiLocalDateTimeAdapter
import com.kaciula.archiman.infrastructure.data.util.moshi.MoshiLocalTimeAdapter
import com.kaciula.archiman.infrastructure.util.AndroidSchedulerProvider
import com.kaciula.archiman.infrastructure.util.CrashlyticsCrashReporter
import com.kaciula.archiman.presentation.screens.home.effecthandlers.HomeEffectHandlers
import com.kaciula.archiman.presentation.screens.main.Coordinator
import com.kaciula.archiman.presentation.screens.main.CoordinatorImpl
import com.kaciula.archiman.presentation.screens.main.effecthandlers.MainEffectHandlers
import com.kaciula.archiman.presentation.screens.userdetails.effecthandlers.UserDetailsEffectHandlers
import com.squareup.moshi.Moshi
import okhttp3.Cache
import okhttp3.OkHttpClient
import org.koin.dsl.module.applicationContext
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.moshi.MoshiConverterFactory

val AppModule = applicationContext {
    bean { AndroidSchedulerProvider() as SchedulerProvider }
    bean { CoordinatorImpl(get()) as Coordinator }
}

val RemoteModule = applicationContext {
    bean { createOkHttpClientBuilder(get()) }
    bean { createRetrofit(get(), get()) }
}

fun createOkHttpClientBuilder(context: Context): OkHttpClient.Builder {
    val builder = OkHttpClient.Builder()
    val cacheSizeBytes = 2 * 1024 * 1024
    builder.cache(Cache(context.cacheDir, cacheSizeBytes.toLong()))
    return builder
}

fun createRetrofit(moshi: Moshi, okHttpClient: OkHttpClient): StackExchangeApi {
    return Retrofit.Builder().addConverterFactory(MoshiConverterFactory.create(moshi))
        .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
        .baseUrl("https://api.stackexchange.com/2.2/").client(okHttpClient).build()
        .create(StackExchangeApi::class.java)
}

val InfrastructureModule = applicationContext {
    bean { createMoshi() }
    bean { AppRepositoryImpl() as AppRepository }
    bean {
        UserRepositoryImpl(
            UserRemoteDataStore(get()),
            UserLocalDataStore()
        ) as UserRepository
    }
    bean { CrashlyticsCrashReporter(get()) as CrashReporter }
    bean { LocationProviderImpl(get()) as LocationProvider }
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
        bean { HomeEffectHandlers(get(), get(), get()) }
    }
    context(ScreenContext.USER_DETAILS) {
        bean { params ->
            UserDetailsEffectHandlers(params[KoinParam.CONTROLLER], get(), get(), get())
        }
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
    const val USER_DETAILS = "USER_DETAILS"
}