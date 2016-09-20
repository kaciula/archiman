package com.kaciula.archiman.data.util.gson;

import com.google.gson.JsonSyntaxException;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

import java.io.IOException;

public class GsonIntegerTypeAdapter extends TypeAdapter<Number> {

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
            return Integer.parseInt(result);
        } catch (NumberFormatException e) {
            // If we expect an int but we receive a double, we convert to int and lose some
            // precision
            try {
                double value = Double.parseDouble(result);
                return (int) value;
            } catch (NumberFormatException nfe) {
                throw new JsonSyntaxException(e);
            }
        }
    }
}
