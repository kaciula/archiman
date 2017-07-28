package com.kaciula.archiman.data.util.gson

import com.google.gson.JsonSyntaxException
import com.google.gson.TypeAdapter
import com.google.gson.stream.JsonReader
import com.google.gson.stream.JsonToken
import com.google.gson.stream.JsonWriter
import java.io.IOException

class GsonIntegerTypeAdapter : TypeAdapter<Number>() {

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
            return Integer.parseInt(result)
        } catch (nfe1: NumberFormatException) {
            // If we expect an int but we receive a double, we convert to int and lose some
            // precision
            try {
                val value = java.lang.Double.parseDouble(result)
                return value.toInt()
            } catch (nfe: NumberFormatException) {
                throw JsonSyntaxException(nfe)
            }
        }
    }
}
