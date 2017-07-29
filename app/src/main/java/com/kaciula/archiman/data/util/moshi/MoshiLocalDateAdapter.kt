package com.kaciula.archiman.data.util.moshi

import com.squareup.moshi.FromJson
import com.squareup.moshi.ToJson
import org.joda.time.LocalDate
import org.joda.time.format.DateTimeFormat

class MoshiLocalDateAdapter {

    @ToJson fun toJson(value: LocalDate?): String? {
        return value?.toString(DATE_FORMAT)
    }

    @FromJson fun fromJson(value: String?): LocalDate? {
        return if (value != null) DATE_TIME_FORMATTER.parseLocalDate(value) else null
    }

    companion object {
        private val DATE_FORMAT = "yyyy-MM-dd"
        private val DATE_TIME_FORMATTER = DateTimeFormat.forPattern(DATE_FORMAT)
    }
}

