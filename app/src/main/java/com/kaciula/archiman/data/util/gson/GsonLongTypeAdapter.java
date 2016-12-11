package com.kaciula.archiman.data.util.gson;

import com.google.gson.JsonSyntaxException;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

public class GsonLongTypeAdapter extends TypeAdapter<Number> {

  @Override
  public void write(JsonWriter out, Number value) throws IOException {
    out.value(value);
  }

  @Override
  public Number read(JsonReader in) throws IOException {
    if (in.peek() == JsonToken.NULL) {
      in.nextNull();
      return null;
    }
    String result = in.nextString();
    try {
      return Long.parseLong(result);
    } catch (NumberFormatException nfe1) {
      // If we expect a long but we receive a double, we convert to long and lose some
      // precision
      try {
        double value = Double.parseDouble(result);
        return (long) value;
      } catch (NumberFormatException nfe2) {
        throw new JsonSyntaxException(nfe2);
      }
    }
  }
}
