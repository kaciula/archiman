package com.kaciula.archiman.domain.util;

import io.reactivex.Observable;

public abstract class UseCase<Q extends UseCase.RequestModel, P extends UseCase.ResponseModel> {

  public abstract Observable<P> execute(Q requestModel);

  public interface RequestModel {
  }


  public interface ResponseModel {

  }
}
