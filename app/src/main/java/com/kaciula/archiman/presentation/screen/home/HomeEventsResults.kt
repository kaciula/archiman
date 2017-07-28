package com.kaciula.archiman.presentation.screen.home

sealed class HomeViewEvent {
    class GetUsers : HomeViewEvent()
    data class ClickUser(val user: UserViewModel) : HomeViewEvent()
    class ClickOkUserDialog : HomeViewEvent()
    class CancelUserDialog : HomeViewEvent()
    /* This event is triggered whenever there is an orientation change or we're coming back to this screen */
    class Recreate : HomeViewEvent()
}

sealed class HomeResult {
    data class GetUsers(val response: com.kaciula.archiman.domain.usecases.GetUsers.ResponseModel) : HomeResult()
    data class ClickUser(val user: UserViewModel) : HomeResult()
    class ClickOkUserDialog : HomeResult()
    class CancelUserDialog : HomeResult()
    class Recreate : HomeResult()
}

