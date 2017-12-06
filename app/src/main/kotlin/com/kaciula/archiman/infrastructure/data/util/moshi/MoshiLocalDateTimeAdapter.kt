package com.kaciula.archiman.infrastructure.data.util.moshi

import com.squareup.moshi.FromJson
import com.squareup.moshi.ToJson
import org.joda.time.LocalDateTime
import org.joda.time.format.DateTimeFormat

class MoshiLocalDateTimeAdapter {

    @ToJson fun toJson(value: LocalDateTime?): String? {
        return value?.toString(DATE_TIME_FORMAT)
    }

    @FromJson fun fromJson(value: String?): LocalDateTime? {
        return if (value != null) DATE_TIME_FORMATTER.parseLocalDateTime(value) else null
    }

    companion object {
        private val DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss"
        private val DATE_TIME_FORMATTER = DateTimeFormat.forPattern(DATE_TIME_FORMAT)
    }
}

