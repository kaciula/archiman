package com.kaciula.archiman.data

import com.kaciula.archiman.domain.boundary.data.UserRepository
import com.kaciula.archiman.domain.entity.User
import io.reactivex.Observable
import org.joda.time.LocalDateTime
import timber.log.Timber
import java.util.*

class UserRepositoryImpl(private val usersRemoteDataSource: UserDataSource,
                         private val usersLocalDataSource: UserDataSource) : UserRepository {

    private var lastTimeUsedRemote: LocalDateTime = LocalDateTime().minusMonths(1)

    override fun getUsers(): Observable<List<User>> {
        val remote = usersRemoteDataSource.getUsers()
        val remoteWithSave = remote.doOnNext { users ->
            Timber.d("Remote called")
            lastTimeUsedRemote = LocalDateTime()
            usersLocalDataSource.createOrUpdateUsers(users).blockingAwait()
        }
        val local = usersLocalDataSource.getUsers()
                .filter { LocalDateTime().minusMinutes(1).isBefore(lastTimeUsedRemote) }
                .doOnNext { Timber.d("Local called") }
        return Observable.concat(local, remoteWithSave).first(ArrayList<User>()).toObservable()
    }
}
