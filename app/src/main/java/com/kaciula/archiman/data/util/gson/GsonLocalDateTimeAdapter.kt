package com.kaciula.archiman.data.util.gson

import com.google.gson.TypeAdapter
import com.google.gson.stream.JsonReader
import com.google.gson.stream.JsonToken
import com.google.gson.stream.JsonWriter
import org.joda.time.LocalDateTime
import org.joda.time.format.DateTimeFormat
import java.io.IOException

class GsonLocalDateTimeAdapter : TypeAdapter<LocalDateTime>() {

    @Throws(IOException::class)
    override fun write(writer: JsonWriter, value: LocalDateTime?) {
        if (value != null) {
            writer.value(value.toString(DATE_TIME_FORMAT))
        } else {
            writer.nullValue()
        }
    }

    @Throws(IOException::class)
    override fun read(reader: JsonReader): LocalDateTime? {
        if (reader.peek() == JsonToken.NULL) {
            reader.nextNull()
            return null
        }
        val result = reader.nextString()
        return DATE_TIME_FORMATTER.parseLocalDateTime(result)
    }

    companion object {

        private val DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss"
        private val DATE_TIME_FORMATTER = DateTimeFormat.forPattern(DATE_TIME_FORMAT)
    }
}
