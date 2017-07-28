package com.kaciula.archiman.data;

import com.kaciula.archiman.data.local.prefs.util.BooleanPreference;
import com.kaciula.archiman.data.local.prefs.util.IntPreference;
import com.kaciula.archiman.domain.boundary.data.AppInfoRepository;
import com.kaciula.archiman.infrastructure.ArchimanApplication;
import javax.inject.Inject;
import javax.inject.Named;

public class AppInfoRepositoryImpl implements AppInfoRepository {

  @Inject
  @Named("first_time")
  BooleanPreference firstTimePref;
  @Inject
  @Named("version_code")
  IntPreference versionCodePref;

  public AppInfoRepositoryImpl() {
    ArchimanApplication.Companion.component().inject(this);
  }

  @Override
  public boolean isFirstTime() {
    return firstTimePref.get();
  }

  @Override
  public void saveFirstTime(boolean firstTime) {
    firstTimePref.set(firstTime);
  }

  @Override
  public int getVersionCode() {
    return versionCodePref.get();
  }

  @Override
  public void saveVersionCode(int value) {
    versionCodePref.set(value);
  }
}
