package com.kaciula.archiman.presentation.screens.main

import android.content.Context
import android.widget.Toast
import com.bluelinelabs.conductor.Router
import com.bluelinelabs.conductor.RouterTransaction
import com.kaciula.archiman.presentation.screens.home.HomeController
import com.kaciula.archiman.presentation.screens.home.UserInfoController
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.screens.userdetails.UserDetailsController
import com.kaciula.archiman.presentation.util.conductor.AlertDialogController

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

    override fun showUserInfoDialog(user: UserViewModel) {
        UserInfoController(user).showDialog(homeDialogRouter(), "tag_user_info_dialog")
    }

    override fun showUserInfoOkDialog(title: String, description: String) {
        AlertDialogController(title, description)
            .showDialog(homeDialogRouter(), "tag_user_info_ok_dialog")
    }

    override fun goToUserDetailsScreen(user: UserViewModel) {
        router.pushController(
            RouterTransaction.with(UserDetailsController(user)).tag(TAG_CONTROLLER_USER_DETAILS)
        )
    }

    override fun userDetailsController(): UserDetailsController {
        return router.getControllerWithTag(TAG_CONTROLLER_USER_DETAILS) as UserDetailsController
    }

    private fun homeController(): HomeController {
        return router.getControllerWithTag(TAG_CONTROLLER_HOME) as HomeController
    }

    private fun homeDialogRouter(): Router {
        return homeController().dialogRouter()
    }

    override fun showToast(text: String) {
        Toast.makeText(context, text, Toast.LENGTH_SHORT).show()
    }
}

private const val TAG_CONTROLLER_HOME = "HomeController"
private const val TAG_CONTROLLER_USER_DETAILS = "UserDetailsController"
