package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.presentation.screens.home.UserViewModel

class UserDetailsPresenter(private val view: UserDetailsContract.View,
                           private val user: UserViewModel,
                           private val schedulerProvider: SchedulerProvider) : UserDetailsContract.Presenter {

    override fun init() {
        view.render(UserDetailsState(user.name))
    }

    override fun start() {}

    override fun stop() {}

    override fun destroy() {}
}
