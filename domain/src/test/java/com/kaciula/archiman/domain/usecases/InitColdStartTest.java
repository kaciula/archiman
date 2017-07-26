package com.kaciula.archiman.domain.usecases;


import com.kaciula.archiman.domain.boundary.data.AppInfoRepository;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

public class InitColdStartTest {

  @Mock AppInfoRepository appInfoRepository;

  private InitColdStart useCase;

  @Before
  public void setupUseCase() {
    MockitoAnnotations.initMocks(this);

    useCase = new InitColdStart(appInfoRepository);
  }

  @Test
  public void firstTime() {
    int currentVersionCode = 1;
    Mockito.when(appInfoRepository.isFirstTime()).thenReturn(true);
    Mockito.when(appInfoRepository.getVersionCode()).thenReturn(0);

    useCase.execute(InitColdStart.RequestModel.create(currentVersionCode))
        .subscribe(new Observer<InitColdStart.ResponseModel>() {
                     @Override
                     public void onSubscribe(Disposable d) {
                       // do nothing
                     }

                     @Override
                     public void onNext(InitColdStart.ResponseModel value) {
                       Assert.fail("onNext should not be triggered");
                     }

                     @Override
                     public void onError(Throwable e) {
                       Assert.fail("Failure to init from cold start");
                     }

                     @Override
                     public void onComplete() {
                       // do nothing
                     }
                   }
        );

    Mockito.verify(appInfoRepository).saveFirstTime(false);
    Mockito.verify(appInfoRepository).saveVersionCode(currentVersionCode);
  }

  @Test
  public void newVersion() {
    int currentVersionCode = 2;
    Mockito.when(appInfoRepository.isFirstTime()).thenReturn(false);
    Mockito.when(appInfoRepository.getVersionCode()).thenReturn(1);

    useCase.execute(InitColdStart.RequestModel.create(currentVersionCode))
        .subscribe(new Observer<InitColdStart.ResponseModel>() {
                     @Override
                     public void onSubscribe(Disposable d) {
                       // do nothing
                     }

                     @Override
                     public void onNext(InitColdStart.ResponseModel value) {
                       Assert.fail("onNext should not be triggered");
                     }

                     @Override
                     public void onError(Throwable e) {
                       Assert.fail("Failure to init from cold start");
                     }

                     @Override
                     public void onComplete() {
                       // do nothing
                     }
                   }
        );

    Mockito.verify(appInfoRepository).saveVersionCode(currentVersionCode);
  }
}
