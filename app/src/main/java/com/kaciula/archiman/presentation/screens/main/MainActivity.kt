package com.kaciula.archiman.presentation.screens.main

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.IntentSender
import android.os.Bundle
import com.bluelinelabs.conductor.Conductor
import com.bluelinelabs.conductor.Router
import com.google.android.gms.common.GoogleApiAvailability
import com.google.android.gms.common.api.ResolvableApiException
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.screens.userdetails.LocationSettingsResolved
import com.kaciula.archiman.presentation.screens.userdetails.LocationSettingsStillNotResolved
import com.kaciula.archiman.presentation.util.DevDrawer
import com.kaciula.archiman.presentation.util.base.BaseActivity
import io.reactivex.Single
import kotlinx.android.synthetic.main.activity_main.*
import org.koin.android.ext.android.inject
import timber.log.Timber

class MainActivity : BaseActivity() {

    private val coordinator: Coordinator by inject()

    private lateinit var router: Router
    private lateinit var devDrawer: DevDrawer

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        setSupportActionBar(toolbar)

        router = Conductor.attachRouter(this, controller_container, savedInstanceState)
        (coordinator as CoordinatorImpl).init(router)
        coordinator.start()

        setupDevDrawer()

        checkPlayServices().subscribe { isAvailable ->
            Timber.i("Play services available $isAvailable")
        }
    }

    override fun onResume() {
        super.onResume()
        Timber.i("Resuming ...")
        checkPlayServices().subscribe { isAvailable ->
            Timber.i("Play services available $isAvailable")
        }
    }

    override fun onBackPressed() {
        if (!coordinator.handleBack()) {
            super.onBackPressed()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == REQUEST_SHOW_LOCATION_SETTINGS) {
            if (resultCode == Activity.RESULT_OK) {
                coordinator.userDetailsController().publishEvent(LocationSettingsResolved)
            } else {
                coordinator.userDetailsController().publishEvent(LocationSettingsStillNotResolved)
            }
        } /*else if (requestCode == REQUEST_PLAY_SERVICES_RESOLUTION) {
            Toast.makeText(this, "Play Services resolution", Toast.LENGTH_SHORT).show()
        }*/
    }

    fun showLocationSettingsDialog(settingsResolvableApiException: ResolvableApiException) {
        try {
            // Check the result in onActivityResult()
            settingsResolvableApiException
                .startResolutionForResult(this, REQUEST_SHOW_LOCATION_SETTINGS)
        } catch (sendEx: IntentSender.SendIntentException) {
            Timber.e(sendEx, "Could not open location settings dialog")
        }
    }

    /**
     * Check the device to make sure it has the Google Play Services APK. If
     * it doesn't, display a dialog that allows users to download the APK from
     * the Google Play Store or enable it in the device's system settings.
     */
    private fun checkPlayServices(): Single<Boolean> {
        return Single.create { emitter ->
            GoogleApiAvailability.getInstance()
                .makeGooglePlayServicesAvailable(this)
                .addOnSuccessListener {
                    emitter.onSuccess(true)
                }.addOnFailureListener {
                    emitter.onSuccess(false)
                }
        }


        /*val apiAvailability = GoogleApiAvailability.getInstance()
        val resultCode = apiAvailability.isGooglePlayServicesAvailable(this)
        if (resultCode != ConnectionResult.SUCCESS) {
            if (apiAvailability.isUserResolvableError(resultCode)) {
                apiAvailability
                    .getErrorDialog(this, resultCode, REQUEST_PLAY_SERVICES_RESOLUTION)
                    .show()
            } else {
                Timber.e(Throwable("Play Services not available"))
            }
            return false
        }
        return true*/
    }

    private fun setupDevDrawer() {
        devDrawer = DevDrawer(this)
    }

    companion object {
        fun getStartIntent(context: Context): Intent {
            return Intent(context, MainActivity::class.java)
        }
    }
}

private const val REQUEST_SHOW_LOCATION_SETTINGS = 1
private const val REQUEST_PLAY_SERVICES_RESOLUTION = 9000