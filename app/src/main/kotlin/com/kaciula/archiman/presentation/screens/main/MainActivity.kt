package com.kaciula.archiman.presentation.screens.main

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.support.v4.app.DialogFragment
import android.support.v7.widget.Toolbar
import android.view.ViewGroup
import butterknife.BindView
import butterknife.ButterKnife
import com.bluelinelabs.conductor.Conductor
import com.bluelinelabs.conductor.Router
import com.bluelinelabs.conductor.RouterTransaction
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.screens.home.HomeComponent
import com.kaciula.archiman.presentation.screens.home.HomeController
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.screens.userdetails.UserDetailsController
import com.kaciula.archiman.presentation.util.BaseActivity
import com.kaciula.archiman.presentation.util.DevDrawer
import timber.log.Timber
import java.util.*

class MainActivity : BaseActivity(), ActionBarProvider, ComponentProvider, DialogShowman, Navigator {

    @BindView(R.id.toolbar) lateinit var toolbar: Toolbar
    @BindView(R.id.controller_container) lateinit var container: ViewGroup

    private lateinit var router: Router
    private lateinit var devDrawer: DevDrawer

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        ButterKnife.bind(this)

        setSupportActionBar(toolbar)

        router = Conductor.attachRouter(this, container, savedInstanceState)
        if (!router.hasRootController()) {
            router.setRoot(RouterTransaction.with(HomeController()).tag(TAG_CONTROLLER_HOME))
        }

        setupDevDrawer()
    }

    override fun onStart() {
        super.onStart()
        devDrawer.onStart()
    }

    override fun onResume() {
        super.onResume()
        devDrawer.onResume()
        Timber.i("Resuming ...")
    }

    override fun onBackPressed() {
        if (!router.handleBack()) {
            super.onBackPressed()
        }
    }

    override fun onPause() {
        super.onPause()
        devDrawer.onPause()
    }

    override fun onStop() {
        super.onStop()
        devDrawer.onStop()
    }

    override fun getHomeComponent(): HomeComponent {
        val homeController = router.getControllerWithTag(TAG_CONTROLLER_HOME) as HomeController?
        return homeController!!.component()
    }

    override fun show(dialogFragment: DialogFragment) {
        if (canShowDialogs()) {
            dialogFragment.show(supportFragmentManager, UUID.randomUUID().toString())
        }
    }

    private fun setupDevDrawer() {
        devDrawer = DevDrawer(this)
    }

    override fun goToUserDetailsScreen(user: UserViewModel) {
        router.pushController(
                RouterTransaction.with(UserDetailsController(user)).tag(TAG_CONTROLLER_USER_DETAILS))
    }

    companion object {

        private val TAG_CONTROLLER_HOME = "HomeController"
        private val TAG_CONTROLLER_USER_DETAILS = "UserDetailsController"

        fun getStartIntent(context: Context): Intent {
            return Intent(context, MainActivity::class.java)
        }
    }
}
