package com.kaciula.archiman.infrastructure;

import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.data.local.prefs.PrefsRepository;
import timber.log.Timber;

public class AppManager {

  private PrefsRepository prefsRepository;

  public AppManager(PrefsRepository prefsRepository) {
    this.prefsRepository = prefsRepository;
  }

  public void initializeEveryColdStart() {
    Timber.d("Initialize every cold start");
    int currentVersionCode = BuildConfig.VERSION_CODE;
    if (prefsRepository.firstTime()) {
      Timber.d("First time running the app");
      prefsRepository.saveFirstTime(false);
      prefsRepository.saveVersionCode(currentVersionCode);
    } else {
      if (prefsRepository.versionCode() < currentVersionCode) {
        Timber.d("Old version code %d is replaced with new version code %d",
            prefsRepository.versionCode(), currentVersionCode);
        prefsRepository.saveVersionCode(currentVersionCode);
      } else {
        Timber.d("Just a basic cold start");
      }
    }
  }
}
