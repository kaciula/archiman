package com.kaciula.archiman.data.util.gson;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

import org.joda.time.LocalDateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import java.io.IOException;

public class GsonLocalDateTimeAdapter extends TypeAdapter<LocalDateTime> {

    private static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormat.forPattern
            (DATE_TIME_FORMAT);

    @Override
    public void write(JsonWriter out, LocalDateTime value) throws IOException {
        if (value != null)
            out.value(value.toString(DATE_TIME_FORMAT));
        else
            out.nullValue();
    }

    @Override
    public LocalDateTime read(JsonReader in) throws IOException {
        if (in.peek() == JsonToken.NULL) {
            in.nextNull();
            return null;
        }
        String result = in.nextString();
        return DATE_TIME_FORMATTER.parseLocalDateTime(result);
    }
}
