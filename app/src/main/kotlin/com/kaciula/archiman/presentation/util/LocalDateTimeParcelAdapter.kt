package com.kaciula.archiman.presentation.util

import android.os.Parcel
import io.mironov.smuggler.GlobalAdapter
import io.mironov.smuggler.TypeAdapter
import org.joda.time.LocalDateTime
import org.joda.time.format.DateTimeFormat

@GlobalAdapter
object LocalDateTimeParcelAdapter : TypeAdapter<LocalDateTime> {

    override fun fromParcel(parcel: Parcel): LocalDateTime {
        val formatter = DateTimeFormat.forPattern(DATE_TIME_PATTERN)
        return formatter.parseLocalDateTime(parcel.readString())
    }

    override fun toParcel(value: LocalDateTime, parcel: Parcel, flags: Int) {
        parcel.writeString(value.toString(DATE_TIME_PATTERN))
    }
}

private const val DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss"
