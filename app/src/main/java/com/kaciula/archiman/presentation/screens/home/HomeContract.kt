package com.kaciula.archiman.presentation.screens.home

import com.kaciula.archiman.presentation.util.ElmPresenter
import com.kaciula.archiman.presentation.util.base.BasePresenter

interface HomeContract {

    interface View {

        fun render(state: HomeState)

        fun goToUserDetailsScreen(user: UserViewModel)
    }


    interface Presenter : BasePresenter, ElmPresenter<HomeState> {

        fun onClickRetry()

        fun onClickUser(user: UserViewModel)

        fun onClickOkUserDialog(user: UserViewModel)

        fun onCancelUserDialog()

        fun onClickUserDetails(user: UserViewModel)
    }
}
