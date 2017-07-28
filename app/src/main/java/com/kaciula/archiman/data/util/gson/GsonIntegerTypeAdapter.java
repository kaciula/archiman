package com.kaciula.archiman.data.util.gson;

import com.google.gson.JsonSyntaxException;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

public class GsonIntegerTypeAdapter extends TypeAdapter<Number> {

  @Override
  public void write(JsonWriter writer, Number value) throws IOException {
    writer.value(value);
  }

  @Override
  public Number read(JsonReader reader) throws IOException {
    if (reader.peek() == JsonToken.NULL) {
      reader.nextNull();
      return null;
    }
    String result = reader.nextString();
    try {
      return Integer.parseInt(result);
    } catch (NumberFormatException nfe1) {
      // If we expect an int but we receive a double, we convert to int and lose some
      // precision
      try {
        double value = Double.parseDouble(result);
        return (int) value;
      } catch (NumberFormatException nfe) {
        throw new JsonSyntaxException(nfe);
      }
    }
  }
}
