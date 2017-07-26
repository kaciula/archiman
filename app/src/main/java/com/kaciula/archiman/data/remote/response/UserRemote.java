package com.kaciula.archiman.data.remote.response;

import com.google.auto.value.AutoValue;
import com.google.gson.Gson;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.SerializedName;

@AutoValue
public abstract class UserRemote {
  @SerializedName("account_id")
  public abstract long accountId();

  @SerializedName("display_name")
  public abstract String displayName();

  // This tells auto-value-gson to create a TypeAdapter when parsing json
  public static TypeAdapter<UserRemote> typeAdapter(Gson gson) {
    return new AutoValue_UserRemote.GsonTypeAdapter(gson);
  }
}
