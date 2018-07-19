package com.kaciula.archiman.presentation.screens.main

import android.content.Context
import android.content.Intent
import android.os.Bundle
import com.bluelinelabs.conductor.Conductor
import com.bluelinelabs.conductor.Router
import com.kaciula.archiman.R
import com.kaciula.archiman.injection.Injector
import com.kaciula.archiman.presentation.screens.home.HomeComponent
import com.kaciula.archiman.presentation.screens.home.HomeController
import com.kaciula.archiman.presentation.util.DevDrawer
import com.kaciula.archiman.presentation.util.base.BaseActivity
import kotlinx.android.synthetic.main.activity_main.*
import timber.log.Timber
import javax.inject.Inject

class MainActivity : BaseActivity(), ComponentProvider {

    @Inject
    lateinit var coordinator: Coordinator

    private lateinit var router: Router
    private lateinit var devDrawer: DevDrawer

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        Injector.appComponent.inject(this)

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

    override fun getHomeComponent(): HomeComponent {
        val homeController = router.getControllerWithTag(TAG_CONTROLLER_HOME) as HomeController?
        return homeController!!.component()
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