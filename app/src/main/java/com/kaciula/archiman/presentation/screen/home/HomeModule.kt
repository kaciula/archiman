package com.kaciula.archiman.presentation.screen.home

import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.injection.ActivityScope
import dagger.Module
import dagger.Provides

@Module
class HomeModule(private val view: HomeContract.View) {

    @Provides
    @ActivityScope
    fun providePresenter(schedulerProvider: SchedulerProvider, getUsers: GetUsers): HomeContract.Presenter {
        return HomePresenter(view, schedulerProvider, getUsers)
    }
}
