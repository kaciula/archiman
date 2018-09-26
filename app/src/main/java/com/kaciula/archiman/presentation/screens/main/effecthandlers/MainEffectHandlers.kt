package com.kaciula.archiman.presentation.screens.main.effecthandlers

import com.google.android.gms.common.GoogleApiAvailability
import com.kaciula.archiman.domain.boundary.SchedulerProvider
import com.kaciula.archiman.presentation.screens.main.Coordinator
import com.kaciula.archiman.presentation.screens.main.MainActivity
import com.kaciula.archiman.presentation.screens.main.domain.CheckPlayServices
import com.kaciula.archiman.presentation.screens.main.domain.MainEffect
import com.kaciula.archiman.presentation.screens.main.domain.MainEvent
import com.kaciula.archiman.presentation.screens.main.domain.ShowMessage
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.ObservableTransformer
import io.reactivex.Single
import io.reactivex.functions.Action
import timber.log.Timber

class MainEffectHandlers(
    private val activity: MainActivity,
    private val coordinator: Coordinator,
    private val schedulerProvider: SchedulerProvider
) {

    fun build(): ObservableTransformer<MainEffect, MainEvent> {
        return RxMobius
            .subtypeEffectHandler<MainEffect, MainEvent>()
            .addConsumer(ShowMessage::class.java, ::showToast, schedulerProvider.ui())
            .addAction(CheckPlayServices::class.java, checkPlayServices, schedulerProvider.ui())
            .build()
    }

    private fun showToast(effect: ShowMessage) {
        coordinator.showToast(effect.text)
    }

    private val checkPlayServices = Action {
        checkPlayServices().subscribe { isAvailable ->
            Timber.i("Play services required version already available $isAvailable")
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
                .makeGooglePlayServicesAvailable(activity)
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
}