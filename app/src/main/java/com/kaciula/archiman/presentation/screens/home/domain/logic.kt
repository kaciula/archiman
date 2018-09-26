package com.kaciula.archiman.presentation.screens.home.domain

import com.kaciula.archiman.domain.boundary.User
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.spotify.mobius.*
import java.util.*

class HomeInit : Init<HomeModel, HomeEffect> {
    override fun init(model: HomeModel): First<HomeModel, HomeEffect> {
        if (!model.isContent) {
            return First.first(
                model.copy(isProgress = true, isError = false),
                Effects.effects(GetUsersEffect as HomeEffect)
            )
        }
        return First.first(model)
    }
}


class HomeUpdate : Update<HomeModel, HomeEvent, HomeEffect> {

    override fun update(model: HomeModel, event: HomeEvent): Next<HomeModel, HomeEffect> {
        return when (event) {
            is UsersReceived -> onUsersReceived(model, event)
            GetUsersRequested -> getUsers()
            is UserClicked -> showUserInfoDialog(event.user)
            is UserDetailsClicked -> goToUserDetailsScreen(event.user)
            is UserInfoDialogOkClicked -> showUserInfoOkDialog(event.user)
            UserInfoDialogCancelled -> showToastWithText("Cancelled user info dialog")
            is TimeTickEvent -> showToastWithText(event.dateTime.toString("HH:mm:ss"))
        }
    }

    private fun onUsersReceived(
        model: HomeModel,
        event: UsersReceived
    ): Next<HomeModel, HomeEffect> {
        return Next.next(
            model.copy(
                isProgress = false, isError = false, isContent = true, users = map(event.users)
            )
        )
    }

    private fun getUsers(): Next<HomeModel, HomeEffect> {
        return Next.dispatch(Effects.effects(GetUsersEffect))
    }

    private fun showUserInfoDialog(user: UserViewModel): Next<HomeModel, HomeEffect> {
        return Next.dispatch(Effects.effects(ShowUserInfoDialog(user)))
    }

    private fun goToUserDetailsScreen(user: UserViewModel): Next<HomeModel, HomeEffect> {
        return Next.dispatch(Effects.effects(GoToUserDetailsScreen(user)))
    }

    private fun showUserInfoOkDialog(user: UserViewModel): Next<HomeModel, HomeEffect> {
        return Next.dispatch(Effects.effects(ShowUserInfoOkDialog(user)))
    }

    private fun map(users: List<User>): List<UserViewModel> {
        val usersList = ArrayList<UserViewModel>(users.size)
        for (user in users) {
            usersList.add(UserViewModel(user.name))
        }
        return usersList
    }

    private fun showToastWithText(text: String): Next<HomeModel, HomeEffect> {
        return Next.dispatch(Effects.effects(ShowToast(text)))
    }
}