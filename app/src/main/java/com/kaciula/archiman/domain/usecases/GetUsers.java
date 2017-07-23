package com.kaciula.archiman.domain.usecases;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.domain.boundary.SchedulerProvider;
import com.kaciula.archiman.domain.boundary.data.UserRepository;
import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.util.GenericResult;
import com.kaciula.archiman.domain.util.UseCase;
import io.reactivex.Observable;
import io.reactivex.annotations.Nullable;
import java.util.List;

public class GetUsers
    extends UseCase<GetUsers.RequestModel, GetUsers.ResponseModel> {

  private final UserRepository userRepository;
  private SchedulerProvider schedulerProvider;

  public GetUsers(UserRepository userRepository, SchedulerProvider schedulerProvider) {
    this.userRepository = userRepository;
    this.schedulerProvider = schedulerProvider;
  }

  @Override
  public Observable<ResponseModel> execute(RequestModel requestModel) {
    return userRepository.getUsers()
        .subscribeOn(schedulerProvider.io())
        .map(users -> ResponseModel.success(users))
        .onErrorReturn(throwable -> ResponseModel.error(throwable))
        .observeOn(schedulerProvider.ui())
        .startWith(ResponseModel.IN_FLIGHT);
  }

  @AutoValue
  public abstract static class RequestModel implements UseCase.RequestModel {
    public static RequestModel create() {
      return new AutoValue_GetUsers_RequestModel();
    }
  }


  @AutoValue
  public abstract static class ResponseModel implements UseCase.ResponseModel, GenericResult {
    public abstract boolean inFlight();

    public abstract boolean isError();

    @Nullable
    public abstract Throwable error();

    public abstract boolean isSuccess();

    @Nullable
    public abstract List<User> users();

    public static ResponseModel create(boolean inFlight, boolean isError, Throwable error,
        boolean isSuccess, List<User> users) {
      return new AutoValue_GetUsers_ResponseModel(inFlight, isError, error, isSuccess, users);
    }

    public static final ResponseModel IN_FLIGHT = create(true, false, null, false, null);

    public static ResponseModel error(Throwable throwable) {
      return create(false, true, throwable, false, null);
    }

    public static ResponseModel success(List<User> users) {
      return create(false, false, null, true, users);
    }
  }
}
