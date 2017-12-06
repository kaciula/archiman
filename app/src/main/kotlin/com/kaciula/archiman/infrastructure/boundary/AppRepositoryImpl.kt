package com.kaciula.archiman.infrastructure.boundary

import com.kaciula.archiman.domain.boundary.infrastructure.AppRepository
import com.kaciula.archiman.infrastructure.data.local.prefs.util.BooleanPreference
import com.kaciula.archiman.infrastructure.data.local.prefs.util.IntPreference
import com.kaciula.archiman.injection.Injector
import javax.inject.Inject
import javax.inject.Named

class AppRepositoryImpl : AppRepository {

    @field:[Inject Named("first_time")]
    lateinit var firstTimePref: BooleanPreference
    @field:[Inject Named("version_code")]
    lateinit var versionCodePref: IntPreference

    init {
        Injector.appComponent.inject(this)
    }

    override fun isFirstTime(): Boolean {
        return firstTimePref.get()
    }

    override fun saveFirstTime(firstTime: Boolean) {
        firstTimePref.set(firstTime)
    }

    override fun getVersionCode(): Int {
        return versionCodePref.get()
    }

    override fun saveVersionCode(value: Int) {
        versionCodePref.set(value)
    }
}
