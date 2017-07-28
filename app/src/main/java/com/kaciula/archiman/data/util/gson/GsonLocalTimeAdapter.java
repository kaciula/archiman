package com.kaciula.archiman.data.util.gson;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import org.joda.time.LocalTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class GsonLocalTimeAdapter extends TypeAdapter<LocalTime> {

  private static final String TIME_FORMAT = "HH:mm:ss";
  private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormat.forPattern(TIME_FORMAT);

  @Override
  public void write(JsonWriter writer, LocalTime value) throws IOException {
    if (value != null) {
      writer.value(value.toString(TIME_FORMAT));
    } else {
      writer.nullValue();
    }
  }

  @Override
  public LocalTime read(JsonReader reader) throws IOException {
    if (reader.peek() == JsonToken.NULL) {
      reader.nextNull();
      return null;
    }
    String result = reader.nextString();
    return TIME_FORMATTER.parseLocalTime(result);
  }
}
