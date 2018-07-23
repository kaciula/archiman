package com.kaciula.archiman.presentation.screens.home

import com.kaciula.archiman.domain.model.User
import com.spotify.mobius.*
import java.util.*

data class HomeModel(
    val isProgress: Boolean = false,
    val isContent: Boolean = false,
    val users: List<UserViewModel>? = null,
    val isError: Boolean = false,
    val error: Throwable? = null
)


sealed class HomeEvent
data class UsersReceived(val users: List<User>) : HomeEvent()
object GetUsersRequested : HomeEvent()
data class UserClicked(val user: UserViewModel) : HomeEvent()
data class UserDetailsClicked(val user: UserViewModel) : HomeEvent()
data class UserInfoDialogOkClicked(val user: UserViewModel) : HomeEvent()

sealed class HomeEffect
object GetUsersEffect : HomeEffect()
data class GoToUserDetailsScreen(val user: UserViewModel) : HomeEffect()
data class ShowUserInfoDialog(val user: UserViewModel) : HomeEffect()
data class ShowUserInfoOkDialog(val user: UserViewModel) : HomeEffect()

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
            is UsersReceived -> Next.next(
                model.copy(
                    isProgress = false, isError = false, isContent = true, users = map(event.users)
                )
            )
            GetUsersRequested -> Next.dispatch(Effects.effects(GetUsersEffect))
            is UserClicked -> Next.dispatch(Effects.effects(ShowUserInfoDialog(event.user)))
            is UserDetailsClicked -> Next.dispatch(Effects.effects(GoToUserDetailsScreen(event.user)))
            is UserInfoDialogOkClicked -> Next.dispatch(Effects.effects(ShowUserInfoOkDialog(event.user)))
        }
    }

    private fun map(users: List<User>): List<UserViewModel> {
        val usersList = ArrayList<UserViewModel>(users.size)
        for (user in users) {
            usersList.add(UserViewModel(user.name))
        }
        return usersList
    }
}