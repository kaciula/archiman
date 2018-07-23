package com.kaciula.archiman.presentation.screens.home

import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.presentation.screens.main.Coordinator
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.Observable
import io.reactivex.ObservableTransformer

class HomeEffectHandlers(
    private val schedulerProvider: SchedulerProvider,
    private val getUsers: GetUsers,
    private val coordinator: Coordinator
) {

    fun build(): ObservableTransformer<HomeEffect, HomeEvent> {
        return RxMobius
            .subtypeEffectHandler<HomeEffect, HomeEvent>()
            .addTransformer(GetUsersEffect::class.java, ::handleGetUsers)
            .addTransformer(GoToUserDetailsScreen::class.java, ::handleGoToUserDetailsScreen)
            .addTransformer(ShowUserInfoDialog::class.java, ::handleShowUserInfoDialog)
            .addTransformer(ShowUserInfoOkDialog::class.java, ::handleShowUserInfoOkDialog)
            .build()
    }

    private fun handleGetUsers(request: Observable<GetUsersEffect>): Observable<HomeEvent> {
        return request
            .observeOn(schedulerProvider.io())
            .flatMapSingle { getUsers.execute(GetUsers.RequestModel) }
            .map<HomeEvent> { UsersReceived(it.users) }
    }

    private fun handleGoToUserDetailsScreen(request: Observable<GoToUserDetailsScreen>): Observable<HomeEvent> {
        return request
            .observeOn(schedulerProvider.ui())
            .doOnNext { coordinator.goToUserDetailsScreen(it.user) }
            .flatMap { Observable.empty<HomeEvent>() }
    }

    private fun handleShowUserInfoDialog(request: Observable<ShowUserInfoDialog>): Observable<HomeEvent> {
        return request
            .observeOn(schedulerProvider.ui())
            .doOnNext { coordinator.showUserInfoDialog(it.user) }
            .flatMap { Observable.empty<HomeEvent>() }
    }

    private fun handleShowUserInfoOkDialog(request: Observable<ShowUserInfoOkDialog>): Observable<HomeEvent> {
        return request
            .observeOn(schedulerProvider.ui())
            .doOnNext {
                coordinator.showUserInfoOkDialog(
                    "Success",
                    "Clicked OK on user info dialog for ${it.user}"
                )
            }
            .flatMap { Observable.empty<HomeEvent>() }
    }
}