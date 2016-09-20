package com.kaciula.archiman.data.util.gson;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

import org.joda.time.LocalTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import java.io.IOException;

public class GsonLocalTimeAdapter extends TypeAdapter<LocalTime> {

    private static final String TIME_FORMAT = "HH:mm:ss";
    private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormat.forPattern(TIME_FORMAT);

    @Override
    public void write(JsonWriter out, LocalTime value) throws IOException {
        if (value != null)
            out.value(value.toString(TIME_FORMAT));
        else
            out.nullValue();
    }

    @Override
    public LocalTime read(JsonReader in) throws IOException {
        if (in.peek() == JsonToken.NULL) {
            in.nextNull();
            return null;
        }
        String result = in.nextString();
        return TIME_FORMATTER.parseLocalTime(result);
    }
}
