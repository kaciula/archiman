package com.kaciula.archiman.domain.entity;

import com.google.auto.value.AutoValue;

@AutoValue
public abstract class User {
  public abstract String name();

  public static User create(String name) {
    return new AutoValue_User(name);
  }
}
