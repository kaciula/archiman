package com.kaciula.archiman.data.util.gson;

import com.google.gson.TypeAdapterFactory;
import com.ryanharter.auto.value.gson.GsonTypeAdapterFactory;

@GsonTypeAdapterFactory
public abstract class ApiGsonAdapterFactory implements TypeAdapterFactory {

  public static ApiGsonAdapterFactory create() {
    return new AutoValueGson_ApiGsonAdapterFactory();
  }
}