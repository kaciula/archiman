package com.kaciula.archiman.presentation.screens.home

import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.injection.ActivityScope
import dagger.Module
import dagger.Provides

@Module
class HomeModule(private val view: HomeContract.View) {

    @Provides
    @ActivityScope
    fun providePresenter(getUsers: GetUsers): HomeContract.Presenter = HomePresenter(view, getUsers)
}
