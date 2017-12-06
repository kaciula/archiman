package com.kaciula.archiman.domain.usecases


import com.kaciula.archiman.domain.boundary.infrastructure.AppRepository
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.Mockito
import org.mockito.MockitoAnnotations

class InitColdStartTest {

    @Mock private lateinit var appRepository: AppRepository

    private lateinit var useCase: InitColdStart

    @Before
    fun setupUseCase() {
        MockitoAnnotations.initMocks(this)

        useCase = InitColdStart(appRepository)
    }

    @Test
    fun firstTime() {
        val currentVersionCode = 1
        Mockito.`when`(appRepository.isFirstTime()).thenReturn(true)
        Mockito.`when`(appRepository.getVersionCode()).thenReturn(0)

        val observer = useCase.execute(InitColdStart.RequestModel(currentVersionCode)).test()
        observer.assertNoErrors()

        Mockito.verify<AppRepository>(appRepository).saveFirstTime(false)
        Mockito.verify<AppRepository>(appRepository).saveVersionCode(currentVersionCode)
    }

    @Test
    fun newVersion() {
        val currentVersionCode = 2
        Mockito.`when`(appRepository.isFirstTime()).thenReturn(false)
        Mockito.`when`(appRepository.getVersionCode()).thenReturn(1)

        val observer = useCase.execute(InitColdStart.RequestModel(currentVersionCode)).test()
        observer.assertNoErrors()

        Mockito.verify<AppRepository>(appRepository).saveVersionCode(currentVersionCode)
    }
}
