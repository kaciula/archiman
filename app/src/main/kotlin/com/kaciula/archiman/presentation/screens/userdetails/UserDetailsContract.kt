package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.presentation.util.BasePresenter

interface UserDetailsContract {

    interface View {
        fun render(state: UserDetailsState)
    }


    interface Presenter : BasePresenter
}
