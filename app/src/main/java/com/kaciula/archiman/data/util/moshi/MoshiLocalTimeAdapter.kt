package com.kaciula.archiman.data.util.moshi

import com.squareup.moshi.FromJson
import com.squareup.moshi.ToJson
import org.joda.time.LocalTime
import org.joda.time.format.DateTimeFormat

class MoshiLocalTimeAdapter {

    @ToJson fun toJson(value: LocalTime?): String? {
        return value?.toString(TIME_FORMAT)
    }

    @FromJson fun fromJson(value: String?): LocalTime? {
        return if (value != null) TIME_FORMATTER.parseLocalTime(value) else null
    }

    companion object {
        private val TIME_FORMAT = "HH:mm:ss"
        private val TIME_FORMATTER = DateTimeFormat.forPattern(TIME_FORMAT)
    }
}

