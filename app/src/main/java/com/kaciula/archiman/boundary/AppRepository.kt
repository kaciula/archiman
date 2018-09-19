package com.kaciula.archiman.boundary

import timber.log.Timber

interface AppRepository {

    fun get(): App

    fun save(app: App)
}

data class App(var isFirstTime: Boolean, var versionCode: Int) {

    fun shouldBumpVersion(currentVersionCode: Int): Boolean {
        return isFirstTime || versionCode < currentVersionCode
    }

    fun bumpVersion(currentVersionCode: Int) {
        Timber.i("Old version code $versionCode is replaced with new version code $currentVersionCode")
        isFirstTime = false
        versionCode = currentVersionCode
    }
}
