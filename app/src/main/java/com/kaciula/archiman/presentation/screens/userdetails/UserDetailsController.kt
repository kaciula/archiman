package com.kaciula.archiman.presentation.screens.userdetails

import android.Manifest
import android.os.Bundle
import android.os.Looper
import android.view.View
import com.kaciula.archiman.R
import com.kaciula.archiman.di.KoinParam
import com.kaciula.archiman.di.ScreenContext
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.util.base.BaseController
import com.kaciula.archiman.presentation.util.conductor.BundleBuilder
import com.spotify.mobius.Connection
import com.spotify.mobius.functions.Consumer
import com.tbruyelle.rxpermissions2.RxPermissions
import io.reactivex.Single
import kotlinx.android.synthetic.main.controller_user_details.*
import org.koin.standalone.inject
import org.koin.standalone.releaseContext
import timber.log.Timber

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

    override fun render(state: UserDetailsModel) {
        Timber.i("Render user details model")
        Timber.d("Render Current thread main? ${Looper.myLooper() === Looper.getMainLooper()}")
        tvUserName.text = state.userName
        if (state.isProgressGetLocation) {
            tvStatus.text = "Fetching last known location..."
        } else if (state.isErrorGetLocation) {
            tvStatus.text = "Error fetching location"
        } else if (state.isContentGetLocation) {
            tvStatus.text = "Current location = ${state.lastKnownLocation}"
        }
    }

    override fun ensureLocationPermission(): Single<Boolean> {
        return RxPermissions(activity!!)
            .request(Manifest.permission.ACCESS_FINE_LOCATION)
            .first(false)
    }

    override fun connect(output: Consumer<UserDetailsEvent>): Connection<UserDetailsModel> {
        return object : Connection<UserDetailsModel> {
            override fun accept(value: UserDetailsModel) {
                render(value)
            }

            override fun dispose() {
            }
        }
    }
}

private const val KEY_USER = "key.user"

