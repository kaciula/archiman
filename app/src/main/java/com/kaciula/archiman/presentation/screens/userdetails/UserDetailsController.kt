package com.kaciula.archiman.presentation.screens.userdetails

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.View
import com.kaciula.archiman.R
import com.kaciula.archiman.di.KoinParam
import com.kaciula.archiman.di.ScreenContext
import com.kaciula.archiman.infrastructure.util.MobiusLogger
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.util.base.BaseController
import com.kaciula.archiman.presentation.util.conductor.BundleBuilder
import com.spotify.mobius.Connectable
import com.spotify.mobius.Connection
import com.spotify.mobius.android.MobiusAndroid
import com.spotify.mobius.functions.Consumer
import com.spotify.mobius.rx2.RxMobius
import kotlinx.android.synthetic.main.controller_user_details.*
import org.koin.standalone.inject
import org.koin.standalone.releaseContext
import timber.log.Timber

class UserDetailsController(args: Bundle) : BaseController(args),
    Connectable<UserDetailsModel, UserDetailsEvent> {

    override val layoutRes: Int
        get() = R.layout.controller_user_details

    private val user = args.getParcelable<UserViewModel>(KEY_USER)

    private val effectHandlers: UserDetailsEffectHandlers  by inject { mapOf(KoinParam.CONTROLLER to this) }

    private val loopFactory = RxMobius
        .loop(UserDetailsUpdate(), effectHandlers.build())
        .init(UserDetailsInit())
        .logger(MobiusLogger())
    private val controller = MobiusAndroid
        .controller(loopFactory, UserDetailsModel(userName = user.name))
    private lateinit var output: Consumer<UserDetailsEvent>

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

    override fun onDestroy() {
        releaseContext(ScreenContext.USER_DETAILS)
        super.onDestroy()
    }

    override fun connect(output: Consumer<UserDetailsEvent>): Connection<UserDetailsModel> {
        initialize(output)

        return object : Connection<UserDetailsModel> {
            override fun accept(value: UserDetailsModel) {
                render(value)
            }

            override fun dispose() {
                tearDown()
            }
        }
    }

    private fun initialize(output: Consumer<UserDetailsEvent>) {
        this.output = output
        btnRefreshLocation.setOnClickListener { output.accept(LastKnownLocationRefreshRequested) }
    }

    private fun tearDown() {
        btnRefreshLocation.setOnClickListener(null)
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

    fun accept(event: UserDetailsEvent) {
        output.accept(event)
    }
}

private const val KEY_USER = "key.user"
