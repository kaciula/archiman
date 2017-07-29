package com.kaciula.archiman.data

import com.kaciula.archiman.data.util.moshi.MoshiLocalDateAdapter
import com.kaciula.archiman.data.util.moshi.MoshiLocalDateTimeAdapter
import com.kaciula.archiman.data.util.moshi.MoshiLocalTimeAdapter
import com.squareup.moshi.Moshi
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module
class DataModule {

    @Provides
    @Singleton
    fun provideMoshi(): Moshi {
        return Moshi.Builder()
                .add(MoshiLocalDateTimeAdapter())
                .add(MoshiLocalDateAdapter())
                .add(MoshiLocalTimeAdapter())
                .build()
    }
}
