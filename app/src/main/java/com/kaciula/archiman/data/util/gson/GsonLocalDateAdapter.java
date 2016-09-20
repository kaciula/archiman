package com.kaciula.archiman.data.util.gson;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import java.io.IOException;

public class GsonLocalDateAdapter extends TypeAdapter<LocalDate> {

    private static final String DATE_FORMAT = "yyyy-MM-dd";
    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormat.forPattern
            (DATE_FORMAT);

    @Override
    public void write(JsonWriter out, LocalDate value) throws IOException {
        if (value != null)
            out.value(value.toString(DATE_FORMAT));
        else
            out.nullValue();
    }

    @Override
    public LocalDate read(JsonReader in) throws IOException {
        if (in.peek() == JsonToken.NULL) {
            in.nextNull();
            return null;
        }
        String result = in.nextString();
        return DATE_TIME_FORMATTER.parseLocalDate(result);
    }
}
