package com.kaciula.archiman.domain.usecase;


import com.google.auto.value.AutoValue;
import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.domain.abstractions.PrefsRepository;
import io.reactivex.Completable;
import io.reactivex.Observable;
import io.reactivex.functions.Action;
import timber.log.Timber;

public class InitColdStartUseCase
    extends UseCase<InitColdStartUseCase.RequestValues, InitColdStartUseCase.ResponseValue> {

  private final PrefsRepository prefsRepository;

  public InitColdStartUseCase(PrefsRepository prefsRepository) {
    this.prefsRepository = prefsRepository;
  }

  @Override
  public Observable<ResponseValue> execute(RequestValues requestValues) {
    return Completable.fromAction(new Action() {
      @Override
      public void run() throws Exception {
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
    }).toObservable();
  }

  @AutoValue
  public abstract static class RequestValues implements UseCase.RequestValues {
    public abstract int currentVersionCode();

    public static RequestValues create(int currentVersionCode) {
      return new AutoValue_InitColdStartUseCase_RequestValues(currentVersionCode);
    }
  }


  @AutoValue
  public abstract static class ResponseValue implements UseCase.ResponseValue {
    public static ResponseValue create() {
      return new AutoValue_InitColdStartUseCase_ResponseValue();
    }
  }
}
