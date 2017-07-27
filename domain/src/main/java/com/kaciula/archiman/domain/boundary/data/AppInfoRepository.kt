package com.kaciula.archiman.domain.boundary.data

interface AppInfoRepository {

    fun isFirstTime(): Boolean

    fun saveFirstTime(firstTime: Boolean)

    fun getVersionCode(): Int

    fun saveVersionCode(value: Int)
}
