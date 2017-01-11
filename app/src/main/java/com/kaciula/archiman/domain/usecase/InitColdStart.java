package com.kaciula.archiman.domain.usecase;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.domain.repository.PrefsRepository;
import com.kaciula.archiman.domain.util.UseCase;
import io.reactivex.Completable;
import io.reactivex.Observable;
import io.reactivex.functions.Action;
import timber.log.Timber;

public class InitColdStart
    extends UseCase<InitColdStart.RequestModel, InitColdStart.ResponseModel> {

  private final PrefsRepository prefsRepository;

  public InitColdStart(PrefsRepository prefsRepository) {
    this.prefsRepository = prefsRepository;
  }

  @Override
  public Observable<ResponseModel> execute(final RequestModel requestValues) {
    return Completable.fromAction(new Action() {
      @Override
      public void run() throws Exception {
        Timber.d("Initialize every cold start");
        int currentVersionCode = requestValues.currentVersionCode();
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
  public abstract static class RequestModel implements UseCase.RequestModel {
    public abstract int currentVersionCode();

    public static RequestModel create(int currentVersionCode) {
      return new AutoValue_InitColdStart_RequestModel(currentVersionCode);
    }
  }


  @AutoValue
  public abstract static class ResponseModel implements UseCase.ResponseModel {
    public static ResponseModel create() {
      return new AutoValue_InitColdStart_ResponseModel();
    }
  }
}
