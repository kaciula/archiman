package com.kaciula.archiman.ui;

public interface BasePresenter {

    void start();

    void stop();

    Object getRetainedState();

    void setRetainedState(Object state);
}
