package com.kaciula.archiman.infrastructure.data.local.prefs.util

import android.content.SharedPreferences

class StringPreference @JvmOverloads constructor(private val preferences: SharedPreferences, private val key: String, private val defaultValue: String? = null) {

    fun get(): String {
        return preferences.getString(key, defaultValue)
    }

    fun isSet(): Boolean {
        return preferences.contains(key)
    }

    fun set(value: String) {
        preferences.edit().putString(key, value).apply()
    }

    fun delete() {
        preferences.edit().remove(key).apply()
    }
}
