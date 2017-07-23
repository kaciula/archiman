package com.kaciula.archiman.domain.usecases;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.domain.boundary.data.AppInfoRepository;
import com.kaciula.archiman.domain.util.UseCase;
import io.reactivex.Completable;
import io.reactivex.Observable;
import timber.log.Timber;

public class InitColdStart
    extends UseCase<InitColdStart.RequestModel, InitColdStart.ResponseModel> {

  private final AppInfoRepository appInfoRepository;

  public InitColdStart(AppInfoRepository appInfoRepository) {
    this.appInfoRepository = appInfoRepository;
  }

  @Override
  public Observable<ResponseModel> execute(final RequestModel requestModel) {
    return Completable.fromAction(() -> {
      Timber.d("Initialize every cold start");
      int currentVersionCode = requestModel.currentVersionCode();
      if (appInfoRepository.isFirstTime()) {
        Timber.d("First time running the app");
        appInfoRepository.saveFirstTime(false);
        appInfoRepository.saveVersionCode(currentVersionCode);
      } else {
        if (appInfoRepository.getVersionCode() < currentVersionCode) {
          Timber.d("Old version code %d is replaced with new version code %d",
              appInfoRepository.getVersionCode(), currentVersionCode);
          appInfoRepository.saveVersionCode(currentVersionCode);
        } else {
          Timber.d("Just a basic cold start");
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
  abstract static class ResponseModel implements UseCase.ResponseModel {
    public static ResponseModel create() {
      return new AutoValue_InitColdStart_ResponseModel();
    }
  }
}
