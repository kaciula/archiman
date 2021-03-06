package com.kaciula.archiman.domain.boundary

import com.kaciula.archiman.domain.util.Timberific

interface AppRepository {

    fun get(): App

    fun save(app: App)
}

data class App(var isFirstTime: Boolean, var versionCode: Int) {

    fun shouldBumpVersion(currentVersionCode: Int): Boolean {
        return isFirstTime || versionCode < currentVersionCode
    }

    fun bumpVersion(currentVersionCode: Int) {
        Timberific.i("Old version code $versionCode is replaced with new version code $currentVersionCode")
        isFirstTime = false
        versionCode = currentVersionCode
    }
}
