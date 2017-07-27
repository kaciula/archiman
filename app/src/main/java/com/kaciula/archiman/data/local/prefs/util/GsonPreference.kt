package com.kaciula.archiman.data.local.prefs.util

import android.content.SharedPreferences
import com.google.gson.Gson

class GsonPreference<T>(private val preferences: SharedPreferences, private val key: String,
                        private val defaultValue: T, private val type: Class<T>,
                        private val gson: Gson) {

    fun get(): T {
        val value = preferences.getString(key, "")
        if (value.isBlank()) {
            return defaultValue
        }
        return gson.fromJson(value, type)
    }

    fun isSet(): Boolean {
        return preferences.contains(key)
    }

    fun set(value: T) {
        if (value != null) {
            preferences.edit().putString(key, gson.toJson(value, type)).apply()
        } else {
            preferences.edit().putString(key, null).apply()
        }
    }

    fun delete() {
        preferences.edit().remove(key).apply()
    }
}
