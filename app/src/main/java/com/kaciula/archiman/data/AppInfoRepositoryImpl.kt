package com.kaciula.archiman.data

import com.kaciula.archiman.data.local.prefs.util.BooleanPreference
import com.kaciula.archiman.data.local.prefs.util.IntPreference
import com.kaciula.archiman.domain.boundary.data.AppInfoRepository
import com.kaciula.archiman.infrastructure.ArchimanApplication
import javax.inject.Inject
import javax.inject.Named

class AppInfoRepositoryImpl : AppInfoRepository {

    @field:[Inject Named("first_time")]
    lateinit var firstTimePref: BooleanPreference
    @field:[Inject Named("version_code")]
    lateinit var versionCodePref: IntPreference

    init {
        ArchimanApplication.component().inject(this)
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
