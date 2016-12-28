package com.kaciula.archiman.domain.abstractions;


import com.kaciula.archiman.domain.model.User;
import io.reactivex.Observable;
import java.util.List;

public interface UsersRepository {
  Observable<List<User>> getUsers();
}
