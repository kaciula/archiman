package com.kaciula.archiman.domain.model

import com.kaciula.archiman.domain.util.Timberific

data class App(
    var isFirstTime: Boolean,
    var versionCode: Int
) {

    fun shouldBumpVersion(currentVersionCode: Int): Boolean {
        return isFirstTime || versionCode < currentVersionCode
    }

    fun bumpVersion(currentVersionCode: Int) {
        isFirstTime = false
        versionCode = currentVersionCode
        Timberific.i("Old version code $versionCode is replaced with new version code $currentVersionCode")
    }
}