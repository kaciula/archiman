package com.kaciula.archiman.domain.boundary.data;

public interface AppInfoRepository {

  boolean isFirstTime();

  void saveFirstTime(boolean firstTime);

  int getVersionCode();

  void saveVersionCode(int value);
}
