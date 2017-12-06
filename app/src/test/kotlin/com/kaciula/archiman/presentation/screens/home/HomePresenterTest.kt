package com.kaciula.archiman.presentation.screens.home


import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.presentation.util.Elm
import org.junit.Before
import org.mockito.Mock
import org.mockito.MockitoAnnotations

class HomePresenterTest {

    @Mock lateinit var view: HomeContract.View
    @Mock lateinit var getUsers: GetUsers

    private lateinit var presenter: HomePresenter

    @Before
    fun setupPresenter() {
        MockitoAnnotations.initMocks(this)

        presenter = HomePresenter(view, Elm(), getUsers)
    }
}
