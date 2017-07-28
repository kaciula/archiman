package com.kaciula.archiman.data

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.kaciula.archiman.data.util.gson.*
import dagger.Module
import dagger.Provides
import org.joda.time.LocalDate
import org.joda.time.LocalDateTime
import org.joda.time.LocalTime
import javax.inject.Singleton

@Module
class DataModule {

    @Provides
    @Singleton
    fun provideGson(): Gson {
        val gsonBuilder = GsonBuilder()

        gsonBuilder.registerTypeAdapter(LocalDateTime::class.java, GsonLocalDateTimeAdapter())
        gsonBuilder.registerTypeAdapter(LocalDate::class.java, GsonLocalDateAdapter())
        gsonBuilder.registerTypeAdapter(LocalTime::class.java, GsonLocalTimeAdapter())

        val gsonLongTypeAdapter = GsonLongTypeAdapter()
        val gsonIntegerTypeAdapter = GsonIntegerTypeAdapter()
        gsonBuilder.registerTypeAdapter(Long::class.javaPrimitiveType, gsonLongTypeAdapter)
        gsonBuilder.registerTypeAdapter(Long::class.java, gsonLongTypeAdapter)
        gsonBuilder.registerTypeAdapter(Int::class.javaPrimitiveType, gsonIntegerTypeAdapter)
        gsonBuilder.registerTypeAdapter(Int::class.java, gsonIntegerTypeAdapter)

        gsonBuilder.registerTypeAdapterFactory(ApiGsonAdapterFactory.create())
        return gsonBuilder.create()
    }
}
