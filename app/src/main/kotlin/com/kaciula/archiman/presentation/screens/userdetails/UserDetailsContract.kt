package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.presentation.util.BasePresenter
import io.reactivex.Single

interface UserDetailsContract {

    interface View {
        fun render(state: UserDetailsState)

        fun ensureLocationPermission(): Single<Boolean>
    }


    interface Presenter : BasePresenter
}
