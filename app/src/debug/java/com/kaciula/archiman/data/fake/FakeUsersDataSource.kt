package com.kaciula.archiman.data.fake

import com.kaciula.archiman.data.UserDataStore
import com.kaciula.archiman.domain.entity.User
import io.reactivex.Completable
import io.reactivex.Observable
import java.util.*

class FakeUsersDataSource : UserDataStore {

    override fun getUsers(): Observable<List<User>> {
        val users = ArrayList<User>(6)
        users.add(User(1, "ka"))
        users.add(User(2, "andrei"))
        users.add(User(3, "arti"))
        users.add(User(4, "marius"))
        users.add(User(5, "stefan"))
        users.add(User(6, "bogdan"))
        return Observable.just<List<User>>(users)
    }

    override fun createOrUpdateUsers(users: List<User>): Completable {
        return Completable.fromAction {
            // Do nothing here
        }
    }
}
