package com.kaciula.archiman.presentation.screen.home

sealed class HomeViewEvent {
    class FirstInit : HomeViewEvent()
    data class ClickUser(val user: UserViewModel) : HomeViewEvent()
    class ClickOkUserDialog : HomeViewEvent()
    class CancelUserDialog : HomeViewEvent()
    class ClickRetry : HomeViewEvent()
    /* This event is triggered whenever there is an orientation change or we're coming back to this screen */
    class Recreate : HomeViewEvent()
}

sealed class HomeResult {
    data class FirstInit(val response: com.kaciula.archiman.domain.usecases.GetUsers.ResponseModel) : HomeResult()
    data class ClickUser(val user: UserViewModel) : HomeResult()
    class ClickOkUserDialog : HomeResult()
    class CancelUserDialog : HomeResult()
    class ClickRetry(val response: com.kaciula.archiman.domain.usecases.GetUsers.ResponseModel) : HomeResult()
    class Recreate : HomeResult()
}

