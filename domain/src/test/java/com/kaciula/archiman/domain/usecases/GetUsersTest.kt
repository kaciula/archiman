package com.kaciula.archiman.domain.usecases


import com.kaciula.archiman.domain.boundary.data.UserRepository
import com.kaciula.archiman.domain.entity.User
import com.kaciula.archiman.domain.util.TrampolineSchedulerProvider
import io.reactivex.Observable
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

        useCase = GetUsers(userRepository, TrampolineSchedulerProvider())
    }

    @Test
    fun getUsersSuccess() {
        val users = arrayListOf(User(1, "Best programmer"), User(2, "Second best programmer"))
        Mockito.`when`(userRepository.users).thenReturn(Observable.fromArray(users))

        val observer = useCase.execute(GetUsers.RequestModel()).test()
        observer.assertValues(
                GetUsers.ResponseModel.IN_FLIGHT,
                GetUsers.ResponseModel.success(users))
    }

    @Test
    fun getUsersFailure() {
        val error = Throwable()
        Mockito.`when`(userRepository.users).thenReturn(Observable.error(error))

        val observer = useCase.execute(GetUsers.RequestModel()).test()
        observer.assertValues(
                GetUsers.ResponseModel.IN_FLIGHT,
                GetUsers.ResponseModel.error(error))
    }
}
