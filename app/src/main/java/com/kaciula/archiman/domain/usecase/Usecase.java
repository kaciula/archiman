package com.kaciula.archiman.domain.usecase;

import io.reactivex.Observable;

public abstract class Usecase<Q extends Usecase.RequestValues, P extends Usecase.ResponseValue> {

  public abstract Observable<P> execute(Q requestValues);

  public interface RequestValues {
  }


  public interface ResponseValue {

  }
}
