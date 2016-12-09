package com.kaciula.archiman.data.remote.response;

import com.google.auto.value.AutoValue;
import com.google.gson.Gson;
import com.google.gson.TypeAdapter;

import java.util.List;

@AutoValue
public abstract class UsersResponse {
    public abstract List<UserResponse> items();

    // This tells auto-value-gson to create a TypeAdapter when parsing json
    public static TypeAdapter<UsersResponse> typeAdapter(Gson gson) {
        return new AutoValue_UsersResponse.GsonTypeAdapter(gson);
    }
}
