package com.kaciula.archiman.presentation.screens.home

import com.kaciula.archiman.domain.model.User
import com.spotify.mobius.Effects.effects
import com.spotify.mobius.First
import com.spotify.mobius.Init
import com.spotify.mobius.Next
import com.spotify.mobius.Next.dispatch
import com.spotify.mobius.Next.next
import com.spotify.mobius.Update
import org.joda.time.LocalDateTime
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
data class TimeTickEvent(val dateTime: LocalDateTime) : HomeEvent()

sealed class HomeEffect
object GetUsersEffect : HomeEffect()
data class GoToUserDetailsScreen(val user: UserViewModel) : HomeEffect()
data class ShowUserInfoDialog(val user: UserViewModel) : HomeEffect()
data class ShowUserInfoOkDialog(val user: UserViewModel) : HomeEffect()
data class ShowToast(val text: String) : HomeEffect()

class HomeInit : Init<HomeModel, HomeEffect> {
    override fun init(model: HomeModel): First<HomeModel, HomeEffect> {
        if (!model.isContent) {
            return First.first(
                model.copy(isProgress = true, isError = false),
                effects(GetUsersEffect as HomeEffect)
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
            is TimeTickEvent -> showToastWithText(event.dateTime.toString("HH:mm:ss"))
        }
    }

    private fun onUsersReceived(
        model: HomeModel,
        event: UsersReceived
    ): Next<HomeModel, HomeEffect> {
        return next(
            model.copy(
                isProgress = false, isError = false, isContent = true, users = map(event.users)
            )
        )
    }

    private fun getUsers(): Next<HomeModel, HomeEffect> {
        return dispatch(effects(GetUsersEffect))
    }

    private fun showUserInfoDialog(user: UserViewModel): Next<HomeModel, HomeEffect> {
        return dispatch(effects(ShowUserInfoDialog(user)))
    }

    private fun goToUserDetailsScreen(user: UserViewModel): Next<HomeModel, HomeEffect> {
        return dispatch(effects(GoToUserDetailsScreen(user)))
    }

    private fun showUserInfoOkDialog(user: UserViewModel): Next<HomeModel, HomeEffect> {
        return dispatch(effects(ShowUserInfoOkDialog(user)))
    }

    private fun map(users: List<User>): List<UserViewModel> {
        val usersList = ArrayList<UserViewModel>(users.size)
        for (user in users) {
            usersList.add(UserViewModel(user.name))
        }
        return usersList
    }

    private fun showToastWithText(text: String): Next<HomeModel, HomeEffect> {
        return dispatch(effects(ShowToast(text)))
    }
}