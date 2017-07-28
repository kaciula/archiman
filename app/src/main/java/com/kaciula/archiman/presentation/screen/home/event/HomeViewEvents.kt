package com.kaciula.archiman.presentation.screen.home.event

import com.kaciula.archiman.presentation.screen.home.UserViewModel

sealed class HomeViewEvent {
    class GetUsers : HomeViewEvent()
    data class ClickUser(val user: UserViewModel) : HomeViewEvent()
    class ClickOkUserDialog : HomeViewEvent()
    class CancelUserDialog : HomeViewEvent()

    /* This event is triggered whenever there is an orientation change or we're coming back to this screen */
    class Recreate : HomeViewEvent()
}

