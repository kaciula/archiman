package com.kaciula.archiman.presentation.screens.main

import android.content.Context
import android.widget.Toast
import com.bluelinelabs.conductor.Router
import com.bluelinelabs.conductor.RouterTransaction
import com.kaciula.archiman.presentation.screens.home.HomeController

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
