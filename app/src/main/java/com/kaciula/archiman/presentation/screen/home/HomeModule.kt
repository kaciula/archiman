package com.kaciula.archiman.presentation.screen.home

import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.injection.ActivityScope
import com.kaciula.archiman.presentation.util.Elm
import dagger.Module
import dagger.Provides

@Module
class HomeModule(private val view: HomeContract.View) {

    @Provides
    @ActivityScope
    fun providePresenter(getUsers: GetUsers): HomeContract.Presenter
            = HomePresenter(view, Elm(), getUsers)
}
