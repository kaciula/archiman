package com.kaciula.archiman.domain.usecase;

import io.reactivex.Observable;

public abstract class UseCase<Q extends UseCase.RequestValues, P extends UseCase.ResponseValue> {

  public abstract Observable<P> execute(Q requestValues);

  public interface RequestValues {
  }


  public interface ResponseValue {

  }
}
