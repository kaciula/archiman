package com.kaciula.archiman.data.util.gson

import com.google.gson.TypeAdapter
import com.google.gson.stream.JsonReader
import com.google.gson.stream.JsonToken
import com.google.gson.stream.JsonWriter
import org.joda.time.LocalDate
import org.joda.time.format.DateTimeFormat
import java.io.IOException

class GsonLocalDateAdapter : TypeAdapter<LocalDate>() {

    @Throws(IOException::class)
    override fun write(writer: JsonWriter, value: LocalDate?) {
        if (value != null) {
            writer.value(value.toString(DATE_FORMAT))
        } else {
            writer.nullValue()
        }
    }

    @Throws(IOException::class)
    override fun read(reader: JsonReader): LocalDate? {
        if (reader.peek() == JsonToken.NULL) {
            reader.nextNull()
            return null
        }
        val result = reader.nextString()
        return DATE_TIME_FORMATTER.parseLocalDate(result)
    }

    companion object {

        private val DATE_FORMAT = "yyyy-MM-dd"
        private val DATE_TIME_FORMATTER = DateTimeFormat.forPattern(DATE_FORMAT)
    }
}
