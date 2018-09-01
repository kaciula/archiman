package com.kaciula.archiman.presentation.screens.home

import android.app.AlertDialog
import android.app.Dialog
import android.os.Bundle
import android.view.View
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.screens.home.domain.UserInfoDialogCancelled
import com.kaciula.archiman.presentation.screens.home.domain.UserInfoDialogOkClicked
import com.kaciula.archiman.presentation.util.base.BaseDialogController
import com.kaciula.archiman.presentation.util.conductor.BundleBuilder
import kotlinx.android.synthetic.main.controller_user.*

class UserInfoController(args: Bundle) : BaseDialogController(args) {

    override val layoutRes: Int
        get() = R.layout.controller_user

    private val user: UserViewModel = args.getParcelable(KEY_USER)

    constructor(user: UserViewModel) : this(
        BundleBuilder(Bundle())
            .putParcelable(KEY_USER, user)
            .build()
    )

    override fun onViewBound(view: View): Dialog {
        val builder = AlertDialog.Builder(activity)
        builder.setTitle(user.name)
        builder.setView(view)
        builder.setPositiveButton(R.string.all_ok) { _, _ ->
            homeController().publishEvent(UserInfoDialogOkClicked(user))
        }
        render()
        return builder.create()
    }

    override fun onCancel() {
        super.onCancel()
        homeController().publishEvent(UserInfoDialogCancelled)
    }

    private fun render() {
        tvUserName.text = user.name
    }

    private fun homeController() = parentController as HomeController
}

private const val KEY_USER = "key_user"