package com.kaciula.archiman.presentation.util

import android.app.Activity
import android.content.Context
import com.kaciula.archiman.infrastructure.log.LumberYard
import com.kaciula.archiman.infrastructure.log.TimberModule
import io.palaima.debugdrawer.DebugDrawer
import io.palaima.debugdrawer.commons.BuildModule
import io.palaima.debugdrawer.commons.DeviceModule
import timber.log.Timber

class DevDrawer(activity: Activity) {

    private val debugDrawer: DebugDrawer = DebugDrawer.Builder(activity)
        .modules(
            TimberModule(),
            DeviceModule(),
            BuildModule()
        )
        .build()

    companion object {

        fun setupLogging(context: Context) {
            val lumberYard = LumberYard.getInstance(context)
            lumberYard.cleanUp()
            Timber.plant(lumberYard.tree())
        }
    }
}
