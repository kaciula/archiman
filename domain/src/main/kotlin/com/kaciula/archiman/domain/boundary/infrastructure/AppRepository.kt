package com.kaciula.archiman.domain.boundary.infrastructure

interface AppRepository {

    fun isFirstTime(): Boolean

    fun saveFirstTime(firstTime: Boolean)

    fun getVersionCode(): Int

    fun saveVersionCode(value: Int)
}
