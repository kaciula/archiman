package com.kaciula.archiman.injection

import android.content.Context

object Injector {

    lateinit var appComponent: AppComponent

    fun init(context: Context) {
        appComponent = DaggerAppComponent.builder().appModule(AppModule(context)).build()
    }
}

