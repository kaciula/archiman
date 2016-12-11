package com.kaciula.archiman.presentation.screen.main;

import com.google.auto.value.AutoValue;

import com.kaciula.archiman.domain.model.User;

import java.util.List;

@AutoValue
public abstract class MainViewModel {
    public abstract List<User> users();

    public static MainViewModel create(List<User> users) {
        return new AutoValue_MainViewModel(users);
    }
}
