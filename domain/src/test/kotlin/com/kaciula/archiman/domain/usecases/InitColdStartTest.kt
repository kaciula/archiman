package com.kaciula.archiman.domain.usecases


import com.kaciula.archiman.domain.boundary.infrastructure.AppRepository
import com.kaciula.archiman.domain.model.App
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
        val app = App(true, 0)
        val modifiedApp = App(false, currentVersionCode)
        Mockito.`when`(appRepository.get()).thenReturn(app)

        val observer = useCase.execute(InitColdStart.RequestModel(currentVersionCode)).test()
        observer.assertNoErrors()

        Mockito.verify<AppRepository>(appRepository).save(modifiedApp)
    }

    @Test
    fun newVersion() {
        val currentVersionCode = 2
        val app = App(false, 1)
        val modifiedApp = App(false, currentVersionCode)
        Mockito.`when`(appRepository.get()).thenReturn(app)

        val observer = useCase.execute(InitColdStart.RequestModel(currentVersionCode)).test()
        observer.assertNoErrors()

        Mockito.verify<AppRepository>(appRepository).save(modifiedApp)
    }
}
