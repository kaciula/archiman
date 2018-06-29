package com.kaciula.archiman.injection

import com.kaciula.archiman.domain.boundary.infrastructure.CrashReporter
import com.kaciula.archiman.domain.boundary.infrastructure.LocationProvider
import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.infrastructure.util.ArchimanApplication

interface BaseAppComponent {

    fun inject(application: ArchimanApplication)

    fun schedulerProvider(): SchedulerProvider

    fun getUsers(): GetUsers

    fun crashReporter(): CrashReporter

    fun locationProvider(): LocationProvider
}
