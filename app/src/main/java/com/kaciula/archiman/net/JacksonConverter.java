package com.kaciula.archiman.net;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;

import retrofit.converter.ConversionException;
import retrofit.converter.Converter;
import retrofit.mime.TypedByteArray;
import retrofit.mime.TypedInput;
import retrofit.mime.TypedOutput;

/**
 * A {@link Converter} which uses Jackson for reading and writing entities.
 *
 * @author Kai Waldron (kaiwaldron@gmail.com)
 */
public class JacksonConverter implements Converter {
    private static final String MIME_TYPE = "application/json";
    private final ObjectMapper objectMapper;

    public JacksonConverter(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Override
    public Object fromBody(TypedInput body, final Type type) throws ConversionException {
        try {
            final JavaType javaType = TypeFactory.defaultInstance().constructType(type);
            return objectMapper.readValue(body.in(), javaType);
        } catch (final IOException e) {
            throw new ConversionException(e);
        }
    }

    @Override
    public TypedOutput toBody(Object object) {
        try {
            final String json = objectMapper.writeValueAsString(object);
            return new TypedByteArray(MIME_TYPE, json.getBytes("UTF-8"));
        } catch (final JsonProcessingException | UnsupportedEncodingException e) {
            throw new AssertionError(e);
        }
    }
}
