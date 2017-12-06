package com.kaciula.archiman.data.local.prefs.util

import android.content.SharedPreferences

class LongPreference @JvmOverloads constructor(private val preferences: SharedPreferences, private val key: String, private val defaultValue: Long = 0) {

    fun get(): Long {
        return preferences.getLong(key, defaultValue)
    }

    fun isSet(): Boolean {
        return preferences.contains(key)
    }

    fun set(value: Long) {
        preferences.edit().putLong(key, value).apply()
    }

    fun delete() {
        preferences.edit().remove(key).apply()
    }
}
