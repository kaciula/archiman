package com.kaciula.archiman.util

import com.kaciula.archiman.data.remote.StackExchangeApi
import com.kaciula.archiman.data.remote.response.UsersRemote
import com.squareup.moshi.Moshi
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.observers.DisposableObserver
import io.reactivex.schedulers.Schedulers
import okhttp3.OkHttpClient
import org.junit.Before
import org.junit.Test
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.moshi.MoshiConverterFactory
import java.util.concurrent.CountDownLatch

class RxJavaTest {

    private lateinit var api: StackExchangeApi

    @Before
    fun setUp() {
        api = provideApi()
    }

    private fun provideApi(): StackExchangeApi {
        return Retrofit.Builder().addConverterFactory(MoshiConverterFactory.create(provideMoshi()))
                .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                .baseUrl("https://api.stackexchange.com/2.2/").client(OkHttpClient.Builder().build())
                .build()
                .create(StackExchangeApi::class.java)
    }

    private fun provideMoshi() = Moshi.Builder().build()

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
