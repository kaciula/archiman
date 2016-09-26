package com.kaciula.archiman.domain.model;

import android.os.Parcelable;

import com.google.auto.value.AutoValue;

@AutoValue
public abstract class User implements Parcelable {
    public abstract String username();

    public static User create(String username) {
        return new AutoValue_User(username);
    }
}
