package com.kaciula.archiman.data.local.prefs;

import com.kaciula.archiman.data.local.prefs.util.BooleanPreference;
import com.kaciula.archiman.data.local.prefs.util.IntPreference;
import com.kaciula.archiman.infrastructure.ArchimanApplication;
import javax.inject.Inject;
import javax.inject.Named;

public class PrefsRepository {

  @Inject
  @Named("first_time")
  BooleanPreference firstTimePref;
  @Inject
  @Named("version_code")
  IntPreference versionCodePref;

  public PrefsRepository() {
    ArchimanApplication.component().inject(this);
  }

  public boolean firstTime() {
    return firstTimePref.get();
  }

  public void saveFirstTime(boolean firstTime) {
    firstTimePref.set(firstTime);
  }

  public int versionCode() {
    return versionCodePref.get();
  }

  public void saveVersionCode(int value) {
    versionCodePref.set(value);
  }
}
