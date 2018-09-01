package com.kaciula.archiman.presentation.screens.home.effecthandlers

import com.kaciula.archiman.domain.usecases.GetUsers
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.presentation.screens.home.domain.*
import com.kaciula.archiman.presentation.screens.main.Coordinator
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.Observable
import io.reactivex.ObservableTransformer
import io.reactivex.functions.Consumer

class HomeEffectHandlers(
    private val schedulerProvider: SchedulerProvider,
    private val getUsers: GetUsers,
    private val coordinator: Coordinator
) {

    fun build(): ObservableTransformer<HomeEffect, HomeEvent> {
        return RxMobius
            .subtypeEffectHandler<HomeEffect, HomeEvent>()
            .addTransformer(GetUsersEffect::class.java, ::handleGetUsers)
            .addConsumer(
                GoToUserDetailsScreen::class.java,
                goToUserDetailsScreen,
                schedulerProvider.ui()
            )
            .addConsumer(ShowUserInfoDialog::class.java, showUserInfoDialog, schedulerProvider.ui())
            .addConsumer(
                ShowUserInfoOkDialog::class.java,
                showUserInfoOkDialog,
                schedulerProvider.ui()
            )
            .addConsumer(ShowToast::class.java, ::showToast, schedulerProvider.ui())
            .build()
    }

    private fun handleGetUsers(request: Observable<GetUsersEffect>): Observable<HomeEvent> {
        return request
            .observeOn(schedulerProvider.io())
            .flatMapSingle { getUsers.execute(GetUsers.RequestModel) }
            .map<HomeEvent> { UsersReceived(it.users) }
    }

    private fun showToast(effect: ShowToast) {
        coordinator.showToast(effect.text)
    }

    private val goToUserDetailsScreen = Consumer<GoToUserDetailsScreen> {
        coordinator.goToUserDetailsScreen(it.user)
    }

    private val showUserInfoDialog = Consumer<ShowUserInfoDialog> {
        coordinator.showUserInfoDialog(it.user)
    }

    private val showUserInfoOkDialog = Consumer<ShowUserInfoOkDialog> {
        coordinator.showUserInfoOkDialog(
            "Success",
            "Clicked OK on user info dialog for ${it.user}"
        )
    }
}