package com.kaciula.archiman.infrastructure.data.fake

import com.kaciula.archiman.domain.model.User
import com.kaciula.archiman.infrastructure.data.UserDataStore
import io.reactivex.Completable
import io.reactivex.Single
import java.util.*

class FakeUsersDataSource : UserDataStore {

    override fun getUsers(): Single<List<User>> {
        val users = ArrayList<User>(6)
        users.add(User(1, "ka"))
        users.add(User(2, "andrei"))
        users.add(User(3, "arti"))
        users.add(User(4, "marius"))
        users.add(User(5, "stefan"))
        users.add(User(6, "bogdan"))
        return Single.just<List<User>>(users)
    }

    override fun createOrUpdateUsers(users: List<User>): Completable {
        return Completable.fromAction {
            // Do nothing here
        }
    }
}
