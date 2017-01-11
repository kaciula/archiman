package com.kaciula.archiman.domain.repository;

public interface PrefsRepository {

  boolean firstTime();

  void saveFirstTime(boolean firstTime);

  int versionCode();

  void saveVersionCode(int value);
}
