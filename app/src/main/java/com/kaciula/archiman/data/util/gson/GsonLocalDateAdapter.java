package com.kaciula.archiman.data.util.gson;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class GsonLocalDateAdapter extends TypeAdapter<LocalDate> {

  private static final String DATE_FORMAT = "yyyy-MM-dd";
  private static final DateTimeFormatter DATE_TIME_FORMATTER =
      DateTimeFormat.forPattern(DATE_FORMAT);

  @Override
  public void write(JsonWriter writer, LocalDate value) throws IOException {
    if (value != null) {
      writer.value(value.toString(DATE_FORMAT));
    } else {
      writer.nullValue();
    }
  }

  @Override
  public LocalDate read(JsonReader reader) throws IOException {
    if (reader.peek() == JsonToken.NULL) {
      reader.nextNull();
      return null;
    }
    String result = reader.nextString();
    return DATE_TIME_FORMATTER.parseLocalDate(result);
  }
}
