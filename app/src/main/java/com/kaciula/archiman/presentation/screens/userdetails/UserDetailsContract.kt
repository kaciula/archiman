package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.presentation.util.base.BasePresenter
import io.reactivex.Single

interface UserDetailsContract {

    interface View {
        fun render(state: UserDetailsModel)

        fun ensureLocationPermission(): Single<Boolean>
    }


    interface Presenter : BasePresenter
}
