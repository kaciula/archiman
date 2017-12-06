package com.kaciula.archiman.data.local.database

import com.kaciula.archiman.data.UserDataStore
import com.kaciula.archiman.domain.entity.User
import io.reactivex.Completable
import io.reactivex.Observable
import io.realm.Realm
import java.util.*

class UserLocalDataStore : UserDataStore {

    override fun getUsers(): Observable<List<User>> {
        return Observable.fromCallable<List<User>> {
            val realm = Realm.getDefaultInstance()
            val results = realm.where(UserDb::class.java).findAll()

            val users = ArrayList<User>(results.size)
            results.mapTo(users) { User(it.accountId, it.name!!) }
            realm.close()
            users
        }
    }

    override fun createOrUpdateUsers(users: List<User>): Completable {
        return Completable.fromAction {
            val realm = Realm.getDefaultInstance()
            realm.executeTransaction { realm1 ->
                val usersDb = ArrayList<UserDb>(users.size)
                for ((accountId, name) in users) {
                    val userDb = UserDb()
                    userDb.accountId = accountId
                    userDb.name = name
                    usersDb.add(userDb)
                }
                realm1.copyToRealmOrUpdate(usersDb)
            }
            realm.close()
        }
    }
}
