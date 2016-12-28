package com.kaciula.archiman.data.local.prefs;

import com.kaciula.archiman.data.local.prefs.util.BooleanPreference;
import com.kaciula.archiman.data.local.prefs.util.IntPreference;
import com.kaciula.archiman.domain.abstractions.PrefsRepository;
import com.kaciula.archiman.infrastructure.ArchimanApplication;
import javax.inject.Inject;
import javax.inject.Named;

public class PrefsDataRepository implements PrefsRepository {

  @Inject
  @Named("first_time")
  BooleanPreference firstTimePref;
  @Inject
  @Named("version_code")
  IntPreference versionCodePref;

  public PrefsDataRepository() {
    ArchimanApplication.component().inject(this);
  }

  @Override
  public boolean firstTime() {
    return firstTimePref.get();
  }

  @Override
  public void saveFirstTime(boolean firstTime) {
    firstTimePref.set(firstTime);
  }

  @Override
  public int versionCode() {
    return versionCodePref.get();
  }

  @Override
  public void saveVersionCode(int value) {
    versionCodePref.set(value);
  }
}
