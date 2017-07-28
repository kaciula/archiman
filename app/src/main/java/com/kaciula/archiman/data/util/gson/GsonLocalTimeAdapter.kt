package com.kaciula.archiman.data.util.gson

import com.google.gson.TypeAdapter
import com.google.gson.stream.JsonReader
import com.google.gson.stream.JsonToken
import com.google.gson.stream.JsonWriter
import org.joda.time.LocalTime
import org.joda.time.format.DateTimeFormat
import java.io.IOException

class GsonLocalTimeAdapter : TypeAdapter<LocalTime>() {

    @Throws(IOException::class)
    override fun write(writer: JsonWriter, value: LocalTime?) {
        if (value != null) {
            writer.value(value.toString(TIME_FORMAT))
        } else {
            writer.nullValue()
        }
    }

    @Throws(IOException::class)
    override fun read(reader: JsonReader): LocalTime? {
        if (reader.peek() == JsonToken.NULL) {
            reader.nextNull()
            return null
        }
        val result = reader.nextString()
        return TIME_FORMATTER.parseLocalTime(result)
    }

    companion object {

        private val TIME_FORMAT = "HH:mm:ss"
        private val TIME_FORMATTER = DateTimeFormat.forPattern(TIME_FORMAT)
    }
}
