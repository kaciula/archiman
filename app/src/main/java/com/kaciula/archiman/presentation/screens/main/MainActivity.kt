package com.kaciula.archiman.presentation.screens.main

import android.content.Context
import android.content.Intent
import android.os.Bundle
import com.bluelinelabs.conductor.Conductor
import com.bluelinelabs.conductor.Router
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.util.DevDrawer
import com.kaciula.archiman.presentation.util.base.BaseActivity
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
    }

    override fun onResume() {
        super.onResume()
        Timber.i("Resuming ...")
    }

    override fun onBackPressed() {
        if (!coordinator.handleBack()) {
            super.onBackPressed()
        }
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

private const val TAG_CONTROLLER_HOME = "HomeController"