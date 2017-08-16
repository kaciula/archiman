package com.kaciula.archiman.data

import com.kaciula.archiman.domain.entity.User
import io.reactivex.Completable
import io.reactivex.Observable
import io.reactivex.Observer
import io.reactivex.disposables.Disposable
import org.hamcrest.core.Is.`is`
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.Mockito.`when`
import org.mockito.Mockito.verify
import org.mockito.MockitoAnnotations
import java.util.*

class UserRepositoryImplTest {

    @Mock lateinit var usersRemoteDataStore: UserDataStore
    @Mock lateinit var usersLocalDataStore: UserDataStore

    private lateinit var usersRepository: UserRepositoryImpl

    @Before
    fun setupUseCase() {
        MockitoAnnotations.initMocks(this)

        usersRepository = UserRepositoryImpl(usersRemoteDataStore, usersLocalDataStore)
    }

    @Test
    fun getUsers() {
        val users = ArrayList<User>()
        users.add(User(1, "Best programmer"))
        users.add(User(2, "Second best programmer"))
        `when`(usersLocalDataStore.getUsers()).thenReturn(Observable.empty<List<User>>())
        `when`(usersLocalDataStore.createOrUpdateUsers(users)).thenReturn(Completable.complete())
        `when`(usersRemoteDataStore.getUsers()).thenReturn(Observable.fromArray<List<User>>(users))

        usersRepository.getUsers()
                .subscribe(object : Observer<List<User>> {
                    override fun onSubscribe(d: Disposable) {
                        // do nothing
                    }

                    override fun onNext(usersList: List<User>) {
                        Assert.assertThat(usersList, `is`<List<User>>(users))
                    }

                    override fun onError(e: Throwable) {
                        Assert.fail("Failed to receive the users list")
                    }

                    override fun onComplete() {
                        // do nothing
                    }
                }
                )

        verify<UserDataStore>(usersRemoteDataStore).getUsers()
    }
}
