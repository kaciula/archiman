package com.kaciula.archiman.domain.usecase;


import com.google.auto.value.AutoValue;
import com.kaciula.archiman.domain.abstractions.UsersRepository;
import com.kaciula.archiman.domain.model.User;
import io.reactivex.Observable;
import io.reactivex.functions.Function;
import java.util.List;

public class GetUsersUseCase
    extends UseCase<GetUsersUseCase.RequestValues, GetUsersUseCase.ResponseValue> {

  private final UsersRepository usersRepository;

  public GetUsersUseCase(UsersRepository usersRepository) {
    this.usersRepository = usersRepository;
  }

  @Override
  public Observable<ResponseValue> execute(RequestValues requestValues) {
    return usersRepository.getUsers().map(new Function<List<User>, ResponseValue>() {
      @Override
      public ResponseValue apply(List<User> users) throws Exception {
        return ResponseValue.create(users);
      }
    });
  }

  @AutoValue
  public abstract static class RequestValues implements UseCase.RequestValues {
    public static RequestValues create() {
      return new AutoValue_GetUsersUseCase_RequestValues();
    }
  }


  @AutoValue
  public abstract static class ResponseValue implements UseCase.ResponseValue {
    public abstract List<User> users();

    public static ResponseValue create(List<User> users) {
      return new AutoValue_GetUsersUseCase_ResponseValue(users);
    }
  }
}
