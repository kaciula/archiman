package com.kaciula.archiman.injection

import com.kaciula.archiman.domain.boundary.infrastructure.AppRepository
import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = [AppModule::class, DomainModule::class, InfrastructureModule::class])
interface AppComponent : BuildTypeAppComponent {

    fun inject(appRepository: AppRepository)
}
