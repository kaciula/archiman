package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.injection.ActivityScope
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import dagger.Module
import dagger.Provides

@Module
class UserDetailsModule(private val view: UserDetailsContract.View, private val user: UserViewModel) {

    @Provides
    @ActivityScope
    fun providePresenter(schedulerProvider: SchedulerProvider): UserDetailsContract.Presenter {
        return UserDetailsPresenter(view, user, schedulerProvider)
    }
}
