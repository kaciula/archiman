package com.kaciula.archiman.data.local.prefs.util

import android.content.SharedPreferences

class BooleanPreference @JvmOverloads constructor(private val preferences: SharedPreferences, private val key: String, private val defaultValue: Boolean = false) {

    fun get(): Boolean {
        return preferences.getBoolean(key, defaultValue)
    }

    fun isSet(): Boolean {
        return preferences.contains(key)
    }

    fun set(value: Boolean) {
        preferences.edit().putBoolean(key, value).apply()
    }

    fun delete() {
        preferences.edit().remove(key).apply()
    }
}
