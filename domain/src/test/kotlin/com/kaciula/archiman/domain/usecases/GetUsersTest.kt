package com.kaciula.archiman.domain.usecases


import com.kaciula.archiman.domain.boundary.infrastructure.UserRepository
import com.kaciula.archiman.domain.model.User
import io.reactivex.Single
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.Mockito
import org.mockito.MockitoAnnotations

class GetUsersTest {

    @Mock private lateinit var userRepository: UserRepository

    private lateinit var useCase: GetUsers

    @Before
    fun setupUseCase() {
        MockitoAnnotations.initMocks(this)

        useCase = GetUsers(userRepository)
    }

    @Test
    fun getUsersSuccess() {
        val users = arrayListOf(User(1, "Best programmer"), User(2, "Second best programmer"))
        Mockito.`when`(userRepository.getAll()).thenReturn(Single.just(users))

        val observer = useCase.execute(GetUsers.RequestModel).test()
        observer.assertValue(GetUsers.ResponseModel(users = users))
    }

    @Test
    fun getUsersFailure() {
        val error = Throwable()
        Mockito.`when`(userRepository.getAll()).thenReturn(Single.error(error))

        val observer = useCase.execute(GetUsers.RequestModel).test()
        observer.assertError(error.javaClass)
    }
}
