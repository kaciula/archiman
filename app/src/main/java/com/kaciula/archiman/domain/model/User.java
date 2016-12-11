package com.kaciula.archiman.domain.model;

import com.google.auto.value.AutoValue;

import android.os.Parcelable;

@AutoValue
public abstract class User implements Parcelable {
    public abstract String name();

    public static User create(String name) {
        return new AutoValue_User(name);
    }
}
