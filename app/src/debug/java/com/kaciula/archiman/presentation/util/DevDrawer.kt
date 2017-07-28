package com.kaciula.archiman.presentation.util

import android.app.Activity
import com.kaciula.archiman.infrastructure.BaseApplication
import com.kaciula.archiman.infrastructure.log.LumberYard
import com.kaciula.archiman.infrastructure.log.TimberModule
import io.palaima.debugdrawer.DebugDrawer
import io.palaima.debugdrawer.commons.BuildModule
import io.palaima.debugdrawer.commons.DeviceModule
import timber.log.Timber

class DevDrawer(activity: Activity) {

    private val debugDrawer: DebugDrawer = DebugDrawer.Builder(activity)
            .modules(TimberModule(),
                    DeviceModule(activity),
                    BuildModule(activity))
            .build()

    fun onStart() {
        debugDrawer.onStart()
    }

    fun onResume() {
        debugDrawer.onResume()
    }

    fun onPause() {
        debugDrawer.onPause()
    }

    fun onStop() {
        debugDrawer.onStop()
    }

    companion object {

        fun setupLogging() {
            val lumberYard = LumberYard.getInstance(BaseApplication.context)
            lumberYard.cleanUp()
            Timber.plant(lumberYard.tree())
        }
    }
}
