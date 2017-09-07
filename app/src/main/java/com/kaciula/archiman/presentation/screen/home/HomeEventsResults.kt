package com.kaciula.archiman.presentation.screen.home

sealed class HomeViewEvent {
    object FirstInit : HomeViewEvent()
    data class ClickUser(val user: UserViewModel) : HomeViewEvent()
    object ClickOkUserDialog : HomeViewEvent()
    object CancelUserDialog : HomeViewEvent()
    object ClickRetry : HomeViewEvent()
    /* This event is triggered whenever there is an orientation change or we're coming back to this screen */
    object Recreate : HomeViewEvent()
}

sealed class HomeResult {
    data class FirstInit(val response: com.kaciula.archiman.domain.usecases.GetUsers.ResponseModel) : HomeResult()
    data class ClickUser(val user: UserViewModel) : HomeResult()
    object ClickOkUserDialog : HomeResult()
    object CancelUserDialog : HomeResult()
    class ClickRetry(val response: com.kaciula.archiman.domain.usecases.GetUsers.ResponseModel) : HomeResult()
    object Recreate : HomeResult()
}

