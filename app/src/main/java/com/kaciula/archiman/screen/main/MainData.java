package com.kaciula.archiman.screen.main;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.data.model.User;

import java.util.List;

@AutoValue
public abstract class MainData {
    public abstract List<User> users();

    public static MainData create(List<User> users) {
        return new AutoValue_MainData(users);
    }
}
