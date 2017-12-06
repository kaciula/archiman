package com.kaciula.archiman.data.local.prefs.util

import android.content.SharedPreferences

class IntPreference @JvmOverloads constructor(private val preferences: SharedPreferences, private val key: String, private val defaultValue: Int = 0) {

    fun get(): Int {
        return preferences.getInt(key, defaultValue)
    }

    fun isSet(): Boolean {
        return preferences.contains(key)
    }

    fun set(value: Int) {
        preferences.edit().putInt(key, value).apply()
    }

    fun increment() {
        val value = get()
        preferences.edit().putInt(key, value + 1).apply()
    }

    fun delete() {
        preferences.edit().remove(key).apply()
    }
}
