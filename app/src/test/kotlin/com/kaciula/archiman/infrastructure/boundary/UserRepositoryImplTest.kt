package com.kaciula.archiman.infrastructure.boundary

import com.kaciula.archiman.domain.model.User
import com.kaciula.archiman.infrastructure.data.UserDataStore
import io.reactivex.Completable
import io.reactivex.Single
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
        `when`(usersLocalDataStore.getUsers()).thenReturn(Single.just(users))
        `when`(usersLocalDataStore.createOrUpdateUsers(users)).thenReturn(Completable.complete())
        `when`(usersRemoteDataStore.getUsers()).thenReturn(Single.just(users))

        val observer = usersRepository.getAll().test()
        observer.assertValue(users)

        verify<UserDataStore>(usersRemoteDataStore).getUsers()
    }
}
