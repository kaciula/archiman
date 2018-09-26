package com.kaciula.archiman.infrastructure.util

import android.app.Application
import com.chibatching.kotpref.Kotpref
import com.kaciula.archiman.BuildConfig
import com.kaciula.archiman.di.appModules
import com.kaciula.archiman.domain.boundary.AppRepository
import com.kaciula.archiman.domain.util.Timberific
import io.reactivex.plugins.RxJavaPlugins
import io.realm.Realm
import io.realm.RealmConfiguration
import net.danlew.android.joda.JodaTimeAndroid
import org.koin.android.ext.android.inject
import org.koin.android.ext.android.startKoin
import org.koin.log.Logger
import timber.log.Timber

abstract class BaseApplication : Application() {

    private val appRepository: AppRepository by inject()

    override fun onCreate() {
        super.onCreate()

        JodaTimeAndroid.init(this)
        Timberific.init(BuildConfig.DEBUG)
        RxJavaPlugins.setErrorHandler(RxGlobalErrorHandler())

        setupRealm()
        Kotpref.init(this)

        startKoin(this, appModules, logger = koinLogger())

        onSetup()

        initColdStart(BuildConfig.VERSION_CODE)
    }

    abstract fun onSetup()

    abstract fun koinLogger(): Logger

    private fun setupRealm() {
        Realm.init(this)
        Realm.setDefaultConfiguration(RealmConfiguration.Builder().build())
    }

    private fun initColdStart(currentVersionCode: Int) {
        Timber.i("Initialize every cold start")
        val app = appRepository.get()
        if (app.shouldBumpVersion(currentVersionCode)) {
            app.bumpVersion(currentVersionCode)
            appRepository.save(app)
        } else {
            Timber.i("Just a basic cold start")
        }
    }
}
