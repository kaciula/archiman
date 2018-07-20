package com.kaciula.archiman.presentation.screens.userdetails

import android.Manifest
import android.os.Bundle
import android.view.View
import com.kaciula.archiman.R
import com.kaciula.archiman.injection.KoinParam
import com.kaciula.archiman.injection.ScreenContext
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.util.base.BaseController
import com.kaciula.archiman.presentation.util.conductor.BundleBuilder
import com.tbruyelle.rxpermissions2.RxPermissions
import io.reactivex.Single
import kotlinx.android.synthetic.main.controller_user_details.*
import org.koin.standalone.inject
import org.koin.standalone.releaseContext

class UserDetailsController(args: Bundle) : BaseController(args), UserDetailsContract.View {

    override val layoutRes: Int
        get() = R.layout.controller_user_details

    private val user = args.getParcelable<UserViewModel>(KEY_USER)
    private val presenter: UserDetailsContract.Presenter
            by inject { mapOf(KoinParam.VIEW to this, KoinParam.EXTRA to user) }

    constructor(user: UserViewModel) : this(
        BundleBuilder(Bundle())
            .putParcelable(KEY_USER, user)
            .build()
    )

    override fun onViewBound(view: View) {
        presenter.onInit()
    }

    override fun onAttach(view: View) {
        super.onAttach(view)
        presenter.onAttach()
    }

    override fun onDetach(view: View) {
        presenter.onDetach()
        super.onDetach(view)
    }

    override fun onDestroy() {
        presenter.onTerminate()
        releaseContext(ScreenContext.USER_DETAILS)
        super.onDestroy()
    }

    override fun render(state: UserDetailsState) {
        if (state.initialize) {
            tvUserName.text = state.userName
        }
        if (state.isProgressLocation) {
            tvStatus.text = "Fetching last known location"
        } else if (state.isErrorLocation) {
            tvStatus.text = "Error fetching location"
        } else if (state.isContentLocation) {
            tvStatus.text = "Current location = ${state.lastKnownLocation}"
        }
    }

    override fun ensureLocationPermission(): Single<Boolean> {
        return RxPermissions(activity!!)
            .request(Manifest.permission.ACCESS_FINE_LOCATION)
            .first(false)
    }
}

private const val KEY_USER = "key.user"

