package com.kaciula.archiman.util

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.kaciula.archiman.data.remote.StackExchangeApi
import com.kaciula.archiman.data.remote.response.UsersRemote
import com.kaciula.archiman.data.util.gson.*
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.observers.DisposableObserver
import io.reactivex.schedulers.Schedulers
import okhttp3.OkHttpClient
import org.joda.time.LocalDate
import org.joda.time.LocalDateTime
import org.joda.time.LocalTime
import org.junit.Before
import org.junit.Test
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.CountDownLatch

class RxJavaTest {

    private lateinit var api: StackExchangeApi

    @Before
    fun setUp() {
        api = provideApi()
    }

    private fun provideApi(): StackExchangeApi {
        return Retrofit.Builder().addConverterFactory(GsonConverterFactory.create(provideGson()))
                .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                .baseUrl("https://api.stackexchange.com/2.2/").client(OkHttpClient.Builder().build())
                .build()
                .create(StackExchangeApi::class.java)
    }

    private fun provideGson(): Gson {
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

    @Test
    fun unsubscribeCancelsObservable() {
        val disposables = CompositeDisposable()

        val latch = CountDownLatch(1)

        val disposable = api.getUsers()
                .subscribeOn(Schedulers.io())
                .observeOn(Schedulers.io())
                .subscribeWith(object : DisposableObserver<UsersRemote>() {
                    override fun onNext(value: UsersRemote) {}

                    override fun onError(e: Throwable) {
                        latch.countDown()
                    }

                    override fun onComplete() {
                        latch.countDown()
                    }
                })
        disposables.add(disposable)

        disposables.dispose()
        //    latch.await();
    }
}
