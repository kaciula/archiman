package com.kaciula.archiman.injection

import com.kaciula.archiman.domain.boundary.infrastructure.AppRepository
import com.kaciula.archiman.presentation.screens.main.MainActivity
import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = [AppModule::class, DomainModule::class, InfrastructureModule::class])
interface AppComponent : BuildTypeAppComponent {

    fun inject(appRepository: AppRepository)

    fun inject(mainActivity: MainActivity)
}
