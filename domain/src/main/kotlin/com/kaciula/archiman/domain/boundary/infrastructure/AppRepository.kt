package com.kaciula.archiman.domain.boundary.infrastructure

import com.kaciula.archiman.domain.model.App

interface AppRepository {

    fun get(): App

    fun save(app: App)
}
