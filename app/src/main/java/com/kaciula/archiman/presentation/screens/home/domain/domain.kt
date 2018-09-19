package com.kaciula.archiman.presentation.screens.home.domain

import com.kaciula.archiman.boundary.User
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import org.joda.time.LocalDateTime

/** State definition **/
data class HomeModel(
    val isProgress: Boolean = false,
    val isContent: Boolean = false,
    val users: List<UserViewModel>? = null,
    val isError: Boolean = false,
    val error: Throwable? = null
)


/** Things we react to **/
sealed class HomeEvent

data class UsersReceived(val users: List<User>) : HomeEvent()
object GetUsersRequested : HomeEvent()
data class UserClicked(val user: UserViewModel) : HomeEvent()
data class UserDetailsClicked(val user: UserViewModel) : HomeEvent()
data class UserInfoDialogOkClicked(val user: UserViewModel) : HomeEvent()
object UserInfoDialogCancelled : HomeEvent()
data class TimeTickEvent(val dateTime: LocalDateTime) : HomeEvent()

/** Things we'll do **/
sealed class HomeEffect

object GetUsersEffect : HomeEffect()
data class GoToUserDetailsScreen(val user: UserViewModel) : HomeEffect()
data class ShowUserInfoDialog(val user: UserViewModel) : HomeEffect()
data class ShowUserInfoOkDialog(val user: UserViewModel) : HomeEffect()
data class ShowToast(val text: String) : HomeEffect()

