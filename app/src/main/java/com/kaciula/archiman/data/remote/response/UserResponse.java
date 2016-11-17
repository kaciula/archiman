package com.kaciula.archiman.data.remote.response;

import com.google.auto.value.AutoValue;
import com.google.gson.Gson;
import com.google.gson.TypeAdapter;

@AutoValue
public abstract class UserResponse {
    public abstract String login();

    // This tells auto-value-gson to create a TypeAdapter when parsing json
    public static TypeAdapter<UserResponse> typeAdapter(Gson gson) {
        return new AutoValue_UserResponse.GsonTypeAdapter(gson);
    }
}
