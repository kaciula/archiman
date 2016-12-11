package com.kaciula.archiman.presentation.util;

public interface BasePresenter {

  void start();

  void stop();

  Object getRetainedState();

  void setRetainedState(Object state);
}
