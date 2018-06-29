package com.kaciula.archiman.presentation.screens.main

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.support.v7.widget.Toolbar
import android.view.ViewGroup
import butterknife.BindView
import butterknife.ButterKnife
import com.bluelinelabs.conductor.Conductor
import com.bluelinelabs.conductor.Router
import com.bluelinelabs.conductor.RouterTransaction
import com.kaciula.archiman.R
import com.kaciula.archiman.injection.Injector
import com.kaciula.archiman.presentation.screens.home.HomeComponent
import com.kaciula.archiman.presentation.screens.home.HomeController
import com.kaciula.archiman.presentation.util.DevDrawer
import com.kaciula.archiman.presentation.util.base.BaseActivity
import timber.log.Timber
import javax.inject.Inject

class MainActivity : BaseActivity(), ActionBarProvider, ComponentProvider {

    @Inject
    lateinit var coordinator: Coordinator

    @BindView(R.id.toolbar)
    lateinit var toolbar: Toolbar
    @BindView(R.id.controller_container)
    lateinit var container: ViewGroup

    private lateinit var router: Router
    private lateinit var devDrawer: DevDrawer

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        Injector.appComponent.inject(this)
        ButterKnife.bind(this)

        setSupportActionBar(toolbar)

        router = Conductor.attachRouter(this, container, savedInstanceState)
        (coordinator as CoordinatorImpl).init(router)
        if (!router.hasRootController()) {
            router.setRoot(RouterTransaction.with(HomeController()).tag(TAG_CONTROLLER_HOME))
        }

        setupDevDrawer()
    }

    override fun onResume() {
        super.onResume()
        Timber.i("Resuming ...")
    }

    override fun onBackPressed() {
        if (!router.handleBack()) {
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