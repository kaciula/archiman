package com.kaciula.archiman.presentation.screens.main

import android.content.Context
import com.bluelinelabs.conductor.Router
import com.bluelinelabs.conductor.RouterTransaction
import com.kaciula.archiman.presentation.screens.home.HomeController
import com.kaciula.archiman.presentation.screens.home.UserInfoController
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.screens.userdetails.UserDetailsController

class CoordinatorImpl(val context: Context) : Coordinator {

    private lateinit var router: Router

    fun init(router: Router) {
        this.router = router
    }

    override fun start() {
        if (!router.hasRootController()) {
            showHome()
        }
    }

    override fun showHome() {
        router.setRoot(RouterTransaction.with(HomeController()).tag(TAG_CONTROLLER_HOME))
    }

    override fun handleBack(): Boolean {
        return router.handleBack()
    }

    override fun showUserInfo(user: UserViewModel) {
        UserInfoController(user).showDialog(router, "tag_user_info_controller")

    }

    override fun goToUserDetailsScreen(user: UserViewModel) {
        router.pushController(
            RouterTransaction.with(UserDetailsController(user)).tag(TAG_CONTROLLER_USER_DETAILS)
        )
    }
}

private const val TAG_CONTROLLER_HOME = "HomeController"
private const val TAG_CONTROLLER_USER_DETAILS = "UserDetailsController"
