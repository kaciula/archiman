package com.kaciula.archiman.domain.usecase;


import com.google.auto.value.AutoValue;
import com.kaciula.archiman.data.UsersRepository;
import com.kaciula.archiman.domain.model.User;
import io.reactivex.Observable;
import io.reactivex.functions.Function;
import java.util.List;

public class FetchUsersUsecase
    extends Usecase<FetchUsersUsecase.RequestValues, FetchUsersUsecase.ResponseValue> {

  private final UsersRepository usersRepository;

  public FetchUsersUsecase(UsersRepository usersRepository) {
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
  public abstract static class RequestValues implements Usecase.RequestValues {
    public static RequestValues create() {
      return new AutoValue_FetchUsersUsecase_RequestValues();
    }
  }


  @AutoValue
  public abstract static class ResponseValue implements Usecase.ResponseValue {
    public abstract List<User> users();

    public static ResponseValue create(List<User> users) {
      return new AutoValue_FetchUsersUsecase_ResponseValue(users);
    }
  }
}
