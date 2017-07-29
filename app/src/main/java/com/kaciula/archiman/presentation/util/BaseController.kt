package com.kaciula.archiman.presentation.util

import android.os.Bundle
import android.support.v7.app.ActionBar
import android.view.View
import com.kaciula.archiman.presentation.screen.main.ActionBarProvider
import com.kaciula.archiman.presentation.screen.main.DialogShowman
import com.kaciula.archiman.presentation.screen.main.Navigator
import timber.log.Timber

abstract class BaseController : ButterKnifeController {

    protected constructor()

    protected constructor(args: Bundle) : super(args)

    protected fun getActionBar(): ActionBar? {
        val actionBarProvider = activity as ActionBarProvider?
        return actionBarProvider?.getSupportActionBar()
    }

    override fun onAttach(view: View) {
        Timber.i("ATTACH CONTROLLER -> ${javaClass.simpleName}")
        setTitle()
        super.onAttach(view)
    }

    override fun onDetach(view: View) {
        Timber.i("DETACH CONTROLLER -> ${javaClass.simpleName}")
        super.onDetach(view)
    }

    protected fun setTitle() {
        var parentController = parentController
        while (parentController != null) {
            if (parentController is BaseController && parentController.getTitle() != null) {
                return
            }
            parentController = parentController.parentController
        }

        if (getTitle() != null) {
            getActionBar()?.title = getTitle()
        }
    }

    protected fun getTitle(): String? = null

    protected fun getDialogShowman(): DialogShowman = activity as DialogShowman

    protected fun getNavigator(): Navigator = activity as Navigator
}
