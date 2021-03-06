package com.kaciula.archiman.infrastructure.data

import com.kaciula.archiman.domain.boundary.App
import com.kaciula.archiman.domain.boundary.AppRepository
import com.kaciula.archiman.infrastructure.data.local.prefs.AppPref

class AppRepositoryImpl : AppRepository {

    override fun get(): App {
        return App(AppPref.isFirstTime, AppPref.versionCode)
    }

    override fun save(app: App) {
        AppPref.isFirstTime = app.isFirstTime
        AppPref.versionCode = app.versionCode
    }
}
