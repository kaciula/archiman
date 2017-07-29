package com.kaciula.archiman.injection

import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.infrastructure.ArchimanApplication

interface BaseAppComponent {

    fun inject(application: ArchimanApplication)

    fun schedulerProvider(): SchedulerProvider

    fun getUsersUseCase(): GetUsers

    fun crashReporter(): CrashReporter
}
