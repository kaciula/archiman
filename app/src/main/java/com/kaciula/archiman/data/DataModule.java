package com.kaciula.archiman.data;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kaciula.archiman.data.util.gson.GsonIntegerTypeAdapter;
import com.kaciula.archiman.data.util.gson.GsonLocalDateAdapter;
import com.kaciula.archiman.data.util.gson.GsonLocalDateTimeAdapter;
import com.kaciula.archiman.data.util.gson.GsonLocalTimeAdapter;
import com.kaciula.archiman.data.util.gson.GsonLongTypeAdapter;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.joda.time.LocalTime;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class DataModule {

    @Provides
    @Singleton
    Gson provideGson() {
        GsonBuilder gsonBuilder = new GsonBuilder();

        gsonBuilder.registerTypeAdapter(LocalDateTime.class, new GsonLocalDateTimeAdapter());
        gsonBuilder.registerTypeAdapter(LocalDate.class, new GsonLocalDateAdapter());
        gsonBuilder.registerTypeAdapter(LocalTime.class, new GsonLocalTimeAdapter());

        GsonLongTypeAdapter gsonLongTypeAdapter = new GsonLongTypeAdapter();
        GsonIntegerTypeAdapter gsonIntegerTypeAdapter = new GsonIntegerTypeAdapter();
        gsonBuilder.registerTypeAdapter(long.class, gsonLongTypeAdapter);
        gsonBuilder.registerTypeAdapter(Long.class, gsonLongTypeAdapter);
        gsonBuilder.registerTypeAdapter(int.class, gsonIntegerTypeAdapter);
        gsonBuilder.registerTypeAdapter(Integer.class, gsonIntegerTypeAdapter);

        return gsonBuilder.create();
    }
}
