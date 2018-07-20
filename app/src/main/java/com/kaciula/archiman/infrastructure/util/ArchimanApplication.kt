package com.kaciula.archiman.infrastructure.util

import com.chibatching.kotpref.Kotpref
import com.kaciula.archiman.BuildConfig
import com.kaciula.archiman.di.archimanAppModules
import com.kaciula.archiman.domain.usecases.InitColdStart
import com.kaciula.archiman.domain.util.Timberific
import io.reactivex.plugins.RxJavaPlugins
import io.realm.Realm
import io.realm.RealmConfiguration
import org.koin.android.ext.android.inject
import org.koin.android.ext.android.startKoin
import org.koin.log.Logger

abstract class ArchimanApplication : BaseApplication() {

    private val initColdStart: InitColdStart by inject()

    override fun onCreate() {
        super.onCreate()

        Timberific.init(BuildConfig.DEBUG)
        RxJavaPlugins.setErrorHandler(RxGlobalErrorHandler())

        setupRealm()
        Kotpref.init(this)

        onSetup()

        startKoin(this, archimanAppModules, logger = koinLogger())

        initColdStart
            .execute(InitColdStart.RequestModel(BuildConfig.VERSION_CODE))
            .subscribe()
    }

    abstract fun onSetup()

    abstract fun koinLogger(): Logger

    private fun setupRealm() {
        Realm.init(this)
        Realm.setDefaultConfiguration(RealmConfiguration.Builder().build())
    }
}
