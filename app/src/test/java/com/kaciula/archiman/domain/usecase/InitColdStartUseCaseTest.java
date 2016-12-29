package com.kaciula.archiman.domain.usecase;


import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.kaciula.archiman.domain.abstractions.PrefsRepository;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class InitColdStartUseCaseTest {

  @Mock PrefsRepository prefsRepository;

  private InitColdStartUseCase useCase;

  @Before
  public void setupUseCase() {
    MockitoAnnotations.initMocks(this);

    useCase = new InitColdStartUseCase(prefsRepository);
  }

  @Test
  public void firstTime() {
    int currentVersionCode = 1;
    when(prefsRepository.firstTime()).thenReturn(true);
    when(prefsRepository.versionCode()).thenReturn(0);

    useCase.execute(InitColdStartUseCase.RequestValues.create(currentVersionCode))
        .subscribe(new Observer<InitColdStartUseCase.ResponseValue>() {
                     @Override
                     public void onSubscribe(Disposable d) {
                       // do nothing
                     }

                     @Override
                     public void onNext(InitColdStartUseCase.ResponseValue value) {
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

    verify(prefsRepository).saveFirstTime(false);
    verify(prefsRepository).saveVersionCode(currentVersionCode);
  }

  @Test
  public void newVersion() {
    int currentVersionCode = 2;
    when(prefsRepository.firstTime()).thenReturn(false);
    when(prefsRepository.versionCode()).thenReturn(1);

    useCase.execute(InitColdStartUseCase.RequestValues.create(currentVersionCode))
        .subscribe(new Observer<InitColdStartUseCase.ResponseValue>() {
                     @Override
                     public void onSubscribe(Disposable d) {
                       // do nothing
                     }

                     @Override
                     public void onNext(InitColdStartUseCase.ResponseValue value) {
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

    verify(prefsRepository).saveVersionCode(currentVersionCode);
  }
}
