package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.presentation.util.base.BasePresenter
import com.spotify.mobius.Connectable
import io.reactivex.Single

interface UserDetailsContract {

    interface View : Connectable<UserDetailsModel, UserDetailsEvent> {
        fun render(state: UserDetailsModel)

        fun ensureLocationPermission(): Single<Boolean>
    }


    interface Presenter : BasePresenter
}
