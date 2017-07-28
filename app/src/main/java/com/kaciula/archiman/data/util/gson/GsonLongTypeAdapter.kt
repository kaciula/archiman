package com.kaciula.archiman.data.util.gson

import com.google.gson.JsonSyntaxException
import com.google.gson.TypeAdapter
import com.google.gson.stream.JsonReader
import com.google.gson.stream.JsonToken
import com.google.gson.stream.JsonWriter
import java.io.IOException

class GsonLongTypeAdapter : TypeAdapter<Number>() {

    @Throws(IOException::class)
    override fun write(writer: JsonWriter, value: Number) {
        writer.value(value)
    }

    @Throws(IOException::class)
    override fun read(reader: JsonReader): Number? {
        if (reader.peek() == JsonToken.NULL) {
            reader.nextNull()
            return null
        }
        val result = reader.nextString()
        try {
            return java.lang.Long.parseLong(result)
        } catch (nfe1: NumberFormatException) {
            // If we expect a long but we receive a double, we convert to long and lose some
            // precision
            try {
                val value = java.lang.Double.parseDouble(result)
                return value.toLong()
            } catch (nfe2: NumberFormatException) {
                throw JsonSyntaxException(nfe2)
            }
        }
    }
}
