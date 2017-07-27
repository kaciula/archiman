package com.kaciula.archiman.domain.usecases


import com.kaciula.archiman.domain.boundary.data.AppInfoRepository
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.Mockito
import org.mockito.MockitoAnnotations

class InitColdStartTest {

    @Mock private lateinit var appInfoRepository: AppInfoRepository

    private lateinit var useCase: InitColdStart

    @Before
    fun setupUseCase() {
        MockitoAnnotations.initMocks(this)

        useCase = InitColdStart(appInfoRepository)
    }

    @Test
    fun firstTime() {
        val currentVersionCode = 1
        Mockito.`when`(appInfoRepository.isFirstTime).thenReturn(true)
        Mockito.`when`(appInfoRepository.getVersionCode).thenReturn(0)

        val observer = useCase.execute(InitColdStart.RequestModel(currentVersionCode)).test()
        observer.assertNoValues()
        observer.assertNoErrors()

        Mockito.verify<AppInfoRepository>(appInfoRepository).saveFirstTime(false)
        Mockito.verify<AppInfoRepository>(appInfoRepository).saveVersionCode(currentVersionCode)
    }

    @Test
    fun newVersion() {
        val currentVersionCode = 2
        Mockito.`when`(appInfoRepository.isFirstTime).thenReturn(false)
        Mockito.`when`(appInfoRepository.getVersionCode).thenReturn(1)

        val observer = useCase.execute(InitColdStart.RequestModel(currentVersionCode)).test()
        observer.assertNoValues()
        observer.assertNoErrors()

        Mockito.verify<AppInfoRepository>(appInfoRepository).saveVersionCode(currentVersionCode)
    }
}
