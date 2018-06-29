package com.kaciula.archiman.infrastructure.util

import com.chibatching.kotpref.Kotpref
import com.kaciula.archiman.BuildConfig
import com.kaciula.archiman.domain.usecases.InitColdStart
import com.kaciula.archiman.domain.util.Timberific
import com.kaciula.archiman.injection.Injector
import io.reactivex.plugins.RxJavaPlugins
import io.realm.Realm
import io.realm.RealmConfiguration
import javax.inject.Inject

abstract class ArchimanApplication : BaseApplication() {

    @Inject
    lateinit var initColdStart: InitColdStart

    override fun onCreate() {
        super.onCreate()

        Injector.init(applicationContext)
        Injector.appComponent.inject(this)

        Timberific.init(BuildConfig.DEBUG)
        RxJavaPlugins.setErrorHandler(RxGlobalErrorHandler())

        onSetup()

        setupRealm()
        Kotpref.init(this)

        initColdStart
            .execute(InitColdStart.RequestModel(BuildConfig.VERSION_CODE))
            .subscribe()
    }

    abstract fun onSetup()

    private fun setupRealm() {
        Realm.init(this)
        Realm.setDefaultConfiguration(RealmConfiguration.Builder().build())
    }
}
