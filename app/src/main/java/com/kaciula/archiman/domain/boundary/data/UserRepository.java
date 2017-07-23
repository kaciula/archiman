package com.kaciula.archiman.domain.boundary.data;

import com.kaciula.archiman.domain.entity.User;
import io.reactivex.Observable;
import java.util.List;

public interface UserRepository {
  Observable<List<User>> getUsers();
}
