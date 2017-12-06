package com.kaciula.archiman.presentation.screen.home

import com.kaciula.archiman.presentation.util.BasePresenter
import com.kaciula.archiman.presentation.util.ElmPresenter

interface HomeContract {

    interface View {

        fun render(state: HomeState)

        fun goToUserDetailsScreen(user: UserViewModel)
    }


    interface Presenter : BasePresenter, ElmPresenter {

        fun onDoneInitialize()

        fun onClickRetry()

        fun onClickUser(user: UserViewModel)

        fun onShowingUserDialog()

        fun onClickOkUserDialog(user: UserViewModel)

        fun onCancelUserDialog()

        fun onClickUserDetails(user: UserViewModel)
    }
}
