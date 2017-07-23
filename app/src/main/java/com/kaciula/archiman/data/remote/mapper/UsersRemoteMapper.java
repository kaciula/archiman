package com.kaciula.archiman.data.remote.mapper;

import com.kaciula.archiman.data.remote.response.UserRemote;
import com.kaciula.archiman.data.remote.response.UsersRemote;
import com.kaciula.archiman.domain.entity.User;
import io.reactivex.functions.Function;
import java.util.ArrayList;
import java.util.List;

public class UsersRemoteMapper implements Function<UsersRemote, List<User>> {

  @Override
  public List<User> apply(UsersRemote usersRemote) throws Exception {
    List<User> users = new ArrayList<>(usersRemote.items().size());
    for (UserRemote userRemote : usersRemote.items()) {
      users.add(User.create(userRemote.accountId(), userRemote.displayName()));
    }
    return users;
  }
}
