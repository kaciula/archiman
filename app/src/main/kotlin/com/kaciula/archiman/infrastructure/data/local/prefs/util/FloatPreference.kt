package com.kaciula.archiman.infrastructure.data.local.prefs.util

import android.content.SharedPreferences

class FloatPreference @JvmOverloads constructor(private val preferences: SharedPreferences, private val key: String, private val defaultValue: Float = 0f) {

    fun get(): Float {
        return preferences.getFloat(key, defaultValue)
    }

    fun isSet(): Boolean {
        return preferences.contains(key)
    }

    fun set(value: Float) {
        preferences.edit().putFloat(key, value).apply()
    }

    fun delete() {
        preferences.edit().remove(key).apply()
    }
}
