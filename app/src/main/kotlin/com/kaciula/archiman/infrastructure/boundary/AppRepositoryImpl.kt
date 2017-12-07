package com.kaciula.archiman.infrastructure.boundary

import com.kaciula.archiman.domain.boundary.infrastructure.AppRepository
import com.kaciula.archiman.infrastructure.data.local.prefs.AppPref

class AppRepositoryImpl : AppRepository {

    override fun isFirstTime(): Boolean {
        return AppPref.isFirstTime
    }

    override fun saveFirstTime(firstTime: Boolean) {
        AppPref.isFirstTime = firstTime
    }

    override fun getVersionCode(): Int {
        return AppPref.versionCode
    }

    override fun saveVersionCode(value: Int) {
        AppPref.versionCode = value
    }
}
