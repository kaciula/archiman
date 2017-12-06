package com.kaciula.archiman.presentation.screen.userdetails

import com.kaciula.archiman.presentation.util.BasePresenter

interface UserDetailsContract {

    interface View {
        fun render(viewModel: UserDetailsViewModel)
    }


    interface Presenter : BasePresenter
}
