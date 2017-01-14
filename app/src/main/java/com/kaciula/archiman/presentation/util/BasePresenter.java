package com.kaciula.archiman.presentation.util;

import com.kaciula.archiman.presentation.screen.main.Container;

public interface BasePresenter {

  void setContainer(Container container);

  void start();

  void stop();

}
