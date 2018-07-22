package com.kaciula.archiman.presentation.screens.userdetails

import android.Manifest
import android.annotation.SuppressLint
import android.os.Bundle
import android.view.View
import com.kaciula.archiman.R
import com.kaciula.archiman.domain.boundary.infrastructure.LocationProvider
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.infrastructure.util.MobiusLogger
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.util.base.BaseController
import com.kaciula.archiman.presentation.util.conductor.BundleBuilder
import com.spotify.mobius.Connectable
import com.spotify.mobius.Connection
import com.spotify.mobius.android.MobiusAndroid
import com.spotify.mobius.functions.Consumer
import com.spotify.mobius.rx2.RxMobius
import com.tbruyelle.rxpermissions2.RxPermissions
import io.reactivex.ObservableTransformer
import io.reactivex.Single
import kotlinx.android.synthetic.main.controller_user_details.*
import org.koin.standalone.inject
import timber.log.Timber
import java.util.concurrent.TimeUnit

class UserDetailsController(args: Bundle) : BaseController(args),
    Connectable<UserDetailsModel, UserDetailsEvent> {

    override val layoutRes: Int
        get() = R.layout.controller_user_details

    private val user = args.getParcelable<UserViewModel>(KEY_USER)

    private val locationProvider: LocationProvider by inject()
    private val schedulerProvider: SchedulerProvider by inject()

    private val effectHandler = RxMobius
        .subtypeEffectHandler<UserDetailsEffect, UserDetailsEvent>()
        .addTransformer(GetLastKnownLocation::class.java, handleGetLastKnownLocation())
        .addTransformer(RequestLocationPermission::class.java, handleRequestLocationPermission())
        .build()

    private val loopFactory = RxMobius
        .loop(UserDetailsUpdate(), effectHandler)
        .init(UserDetailsInit())
        .logger(MobiusLogger())
    private val controller = MobiusAndroid
        .controller(loopFactory, UserDetailsModel(userName = user.name))

    constructor(user: UserViewModel) : this(
        BundleBuilder(Bundle())
            .putParcelable(KEY_USER, user)
            .build()
    )

    override fun onViewBound(view: View) {
        controller.connect(this)
        controller.start()
    }

    override fun onViewDestroyed() {
        controller.stop()
        controller.disconnect()
        super.onViewDestroyed()
    }

    override fun connect(output: Consumer<UserDetailsEvent>): Connection<UserDetailsModel> {
        btnRefreshLocation.setOnClickListener { output.accept(LastKnownLocationRefreshRequested) }

        return object : Connection<UserDetailsModel> {
            override fun accept(value: UserDetailsModel) {
                render(value)
            }

            override fun dispose() {
                btnRefreshLocation.setOnClickListener(null)
            }
        }
    }

    @SuppressLint("SetTextI18n")
    private fun render(model: UserDetailsModel) {
        Timber.i("Render user details model")
        tvUserName.text = model.userName
        if (model.isProgressGetLocation) {
            tvStatus.text = "Fetching last known location..."
            btnRefreshLocation.visibility = View.INVISIBLE
        } else if (model.isErrorGetLocation) {
            tvStatus.text = "Error fetching location"
            btnRefreshLocation.visibility = View.VISIBLE
        } else if (model.isContentGetLocation) {
            tvStatus.text = "Current location = ${model.lastKnownLocation}"
            btnRefreshLocation.visibility = View.VISIBLE
        }
    }

    private fun ensureLocationPermission(): Single<Boolean> {
        return RxPermissions(activity!!)
            .request(Manifest.permission.ACCESS_FINE_LOCATION)
            .first(false)
    }

    private fun handleGetLastKnownLocation()
            : ObservableTransformer<GetLastKnownLocation, UserDetailsEvent> {
        return ObservableTransformer { effect ->
            effect
                .observeOn(schedulerProvider.ui())
                .flatMapSingle {
                    ensureLocationPermission()
                        .flatMap { granted ->
                            if (granted) {
                                locationProvider.getLastKnownLocation()
                                    .map<UserDetailsEvent> { LastKnownLocationReceived(it) }
                                    .delay(10, TimeUnit.SECONDS)
                            } else {
                                Single.just(GetLocationPermissionDenied)
                            }
                        }
                }
        }
    }

    private fun handleRequestLocationPermission()
            : ObservableTransformer<RequestLocationPermission, UserDetailsEvent> {
        return ObservableTransformer { effect ->
            effect
                .observeOn(schedulerProvider.ui())
                .flatMapSingle {
                    ensureLocationPermission()
                        .map { granted ->
                            if (granted) {
                                LocationPermissionGranted
                            } else {
                                LocationPermissionDenied
                            }
                        }
                }
        }
    }
}

private const val KEY_USER = "key.user"