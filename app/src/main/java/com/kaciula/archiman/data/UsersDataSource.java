package com.kaciula.archiman.data;

import com.kaciula.archiman.domain.model.User;
import io.reactivex.Observable;
import java.util.List;

public interface UsersDataSource {

  Observable<List<User>> getUsers();
}
