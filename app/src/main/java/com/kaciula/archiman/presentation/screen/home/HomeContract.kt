package com.kaciula.archiman.presentation.screen.home

import com.kaciula.archiman.presentation.util.BasePresenter

interface HomeContract {

    interface View {

        fun render(viewModel: HomeViewModel)

        fun goToUserDetailsScreen(user: UserViewModel)
    }


    interface Presenter : BasePresenter {

        fun onClickRetry()

        fun onClickUser(user: UserViewModel)

        fun onClickOkUserDialog(user: UserViewModel)

        fun onCancelUserDialog()

        fun onClickUserDetails(user: UserViewModel)
    }
}
