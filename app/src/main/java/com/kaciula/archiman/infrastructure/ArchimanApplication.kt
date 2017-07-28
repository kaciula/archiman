package com.kaciula.archiman.infrastructure

import com.kaciula.archiman.BuildConfig
import com.kaciula.archiman.domain.usecases.InitColdStart
import com.kaciula.archiman.injection.AppComponent
import com.kaciula.archiman.injection.AppModule
import com.kaciula.archiman.injection.DaggerAppComponent
import io.realm.Realm
import io.realm.RealmConfiguration
import javax.inject.Inject

abstract class ArchimanApplication : BaseApplication() {

    private lateinit var appComponent: AppComponent

    @Inject lateinit var initColdStart: InitColdStart

    override fun onCreate() {
        super.onCreate()

        appComponent = DaggerAppComponent.builder().appModule(AppModule()).build()
        appComponent.inject(this)

        setupRealm()

        initColdStart
                .execute(InitColdStart.RequestModel(BuildConfig.VERSION_CODE))
                .subscribe()
    }

    fun isCrashlyticsUsed() = false

    private fun setupRealm() {
        Realm.init(this)
        val realmConfiguration = RealmConfiguration.Builder().build()
        Realm.setDefaultConfiguration(realmConfiguration)
    }

    companion object {

        fun component(): AppComponent {
            return (context as ArchimanApplication).appComponent
        }

        fun get(): ArchimanApplication {
            return context as ArchimanApplication
        }
    }
}
