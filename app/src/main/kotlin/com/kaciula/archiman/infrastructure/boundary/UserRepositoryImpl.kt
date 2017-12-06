package com.kaciula.archiman.infrastructure.boundary

import com.kaciula.archiman.domain.boundary.infrastructure.UserRepository
import com.kaciula.archiman.domain.model.User
import com.kaciula.archiman.infrastructure.data.UserDataStore
import io.reactivex.Maybe
import io.reactivex.Single
import org.joda.time.LocalDateTime
import timber.log.Timber
import java.util.*

class UserRepositoryImpl(private val usersRemoteDataStore: UserDataStore,
                         private val usersLocalDataStore: UserDataStore) : UserRepository {

    private var lastTimeUsedRemote: LocalDateTime = LocalDateTime().minusMonths(1)

    override fun getAll(): Single<List<User>> {
        val remote = usersRemoteDataStore.getUsers()
        val remoteWithSave = remote.doOnSuccess { users ->
            Timber.d("Remote called")
            lastTimeUsedRemote = LocalDateTime()
            usersLocalDataStore.createOrUpdateUsers(users).blockingAwait()
        }
        val local = usersLocalDataStore.getUsers()
                .filter { LocalDateTime().minusMinutes(1).isBefore(lastTimeUsedRemote) }
                .doOnSuccess { Timber.d("Local called") }
        return Maybe.concat(local, remoteWithSave.toMaybe()).first(ArrayList())
    }
}
