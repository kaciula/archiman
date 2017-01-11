package com.kaciula.archiman.domain.usecase;

import com.google.auto.value.AutoValue;
import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.repository.UsersRepository;
import com.kaciula.archiman.domain.util.UseCase;
import io.reactivex.Observable;
import io.reactivex.functions.Function;
import java.util.List;

public class GetUsers
    extends UseCase<GetUsers.RequestModel, GetUsers.ResponseModel> {

  private final UsersRepository usersRepository;

  public GetUsers(UsersRepository usersRepository) {
    this.usersRepository = usersRepository;
  }

  @Override
  public Observable<ResponseModel> execute(RequestModel requestModel) {
    return usersRepository.getUsers()
        .map(new Function<List<User>, ResponseModel>() {
          @Override
          public ResponseModel apply(List<User> users) throws Exception {
            return ResponseModel.create(users);
          }
        });
  }

  @AutoValue
  public abstract static class RequestModel implements UseCase.RequestModel {
    public static RequestModel create() {
      return new AutoValue_GetUsers_RequestModel();
    }
  }


  @AutoValue
  public abstract static class ResponseModel implements UseCase.ResponseModel {
    public abstract List<User> users();

    public static ResponseModel create(List<User> users) {
      return new AutoValue_GetUsers_ResponseModel(users);
    }
  }
}
