package com.kaciula.archiman.domain.repository;

import com.kaciula.archiman.domain.entity.User;
import io.reactivex.Observable;
import java.util.List;

public interface UsersRepository {
  Observable<List<User>> getUsers();
}
