package com.kaciula.archiman.domain.repository;

public interface AppInfoRepository {

  boolean isFirstTime();

  void saveFirstTime(boolean firstTime);

  int getVersionCode();

  void saveVersionCode(int value);
}
