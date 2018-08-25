package com.kaciula.archiman.presentation.screens.userdetails

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.util.KotlinView
import com.spotify.mobius.Connectable
import com.spotify.mobius.Connection
import com.spotify.mobius.functions.Consumer
import kotlinx.android.synthetic.main.controller_user_details.*
import timber.log.Timber

class UserDetailsView(
    inflater: LayoutInflater,
    container: ViewGroup
) : KotlinView(R.layout.controller_user_details, inflater, container),
    Connectable<UserDetailsModel, UserDetailsEvent> {

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
        btnRefreshLocation.setOnClickListener { output.accept(LastKnownLocationRefreshRequested) }
    }

    override fun tearDown() {
        btnRefreshLocation.setOnClickListener(null)
        super.tearDown()
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
}