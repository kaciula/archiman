package com.kaciula.archiman.infrastructure

import com.kaciula.archiman.BuildConfig
import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import com.kaciula.archiman.domain.usecases.InitColdStart
import com.kaciula.archiman.domain.util.Timberific
import com.kaciula.archiman.injection.AppComponent
import com.kaciula.archiman.injection.AppModule
import com.kaciula.archiman.injection.DaggerAppComponent
import io.realm.Realm
import io.realm.RealmConfiguration
import javax.inject.Inject

abstract class ArchimanApplication : BaseApplication() {

    private lateinit var appComponent: AppComponent

    @Inject lateinit var initColdStart: InitColdStart
    @Inject lateinit var crashReporter: CrashReporter

    override fun onCreate() {
        super.onCreate()

        appComponent = DaggerAppComponent.builder().appModule(AppModule()).build()
        appComponent.inject(this)

        Timberific.init(BuildConfig.DEBUG)

        setupRealm()

        initColdStart
                .execute(InitColdStart.RequestModel(BuildConfig.VERSION_CODE))
                .subscribe()
    }

    open fun isCrashlyticsUsed() = false

    private fun setupRealm() {
        Realm.init(this)
        Realm.setDefaultConfiguration(RealmConfiguration.Builder().build())
    }

    companion object {

        fun component(): AppComponent {
            return get().appComponent
        }

        fun get(): ArchimanApplication {
            return context as ArchimanApplication
        }
    }
}
