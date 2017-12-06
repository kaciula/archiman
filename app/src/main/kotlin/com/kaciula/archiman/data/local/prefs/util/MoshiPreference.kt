package com.kaciula.archiman.data.local.prefs.util

import android.content.SharedPreferences
import com.squareup.moshi.JsonAdapter
import com.squareup.moshi.Moshi

class MoshiPreference<T>(private val preferences: SharedPreferences, private val key: String,
                         private val defaultValue: T, private val type: Class<T>,
                         private val moshi: Moshi) {

    fun get(): T? {
        val value = preferences.getString(key, "")
        if (value.isBlank()) {
            return defaultValue
        }
        val jsonAdapter: JsonAdapter<T> = moshi.adapter(type)
        return jsonAdapter.fromJson(value)
    }

    fun isSet(): Boolean {
        return preferences.contains(key)
    }

    fun set(value: T) {
        if (value != null) {
            val jsonAdapter: JsonAdapter<T> = moshi.adapter(type)
            preferences.edit().putString(key, jsonAdapter.toJson(value)).apply()
        } else {
            preferences.edit().putString(key, null).apply()
        }
    }

    fun delete() {
        preferences.edit().remove(key).apply()
    }
}
