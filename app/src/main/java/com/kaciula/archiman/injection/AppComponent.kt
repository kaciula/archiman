package com.kaciula.archiman.injection

import com.kaciula.archiman.data.AppInfoRepositoryImpl
import com.kaciula.archiman.data.DataModule
import com.kaciula.archiman.data.DataRepositoryModule
import com.kaciula.archiman.data.local.prefs.PrefsModule
import com.kaciula.archiman.data.remote.RemoteModule
import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = arrayOf(AppModule::class, DataModule::class, PrefsModule::class, RemoteModule::class, DataRepositoryModule::class, DomainModule::class))
interface AppComponent : BaseAppComponent {

    fun inject(prefsRepository: AppInfoRepositoryImpl)
}
