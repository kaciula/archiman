package com.kaciula.archiman.infrastructure

import com.kaciula.archiman.BuildConfig
import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import com.kaciula.archiman.domain.usecases.InitColdStart
import com.kaciula.archiman.domain.util.Timberific
import com.kaciula.archiman.injection.Injector
import io.reactivex.plugins.RxJavaPlugins
import io.realm.Realm
import io.realm.RealmConfiguration
import javax.inject.Inject

abstract class ArchimanApplication : BaseApplication() {

    @Inject lateinit var initColdStart: InitColdStart
    @Inject lateinit var crashReporter: CrashReporter

    override fun onCreate() {
        super.onCreate()

        Injector.init(applicationContext)
        Injector.appComponent.inject(this)

        Timberific.init(BuildConfig.DEBUG)
        RxJavaPlugins.setErrorHandler(RxGlobalErrorHandler())

        setupRealm()

        initColdStart
                .execute(InitColdStart.RequestModel(BuildConfig.VERSION_CODE))
                .subscribe()
    }

    private fun setupRealm() {
        Realm.init(this)
        Realm.setDefaultConfiguration(RealmConfiguration.Builder().build())
    }
}
