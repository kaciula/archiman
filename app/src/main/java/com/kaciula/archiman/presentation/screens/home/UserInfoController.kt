package com.kaciula.archiman.presentation.screens.home

import android.app.AlertDialog
import android.app.Dialog
import android.os.Bundle
import android.view.View
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.util.conductor.BundleBuilder
import com.kaciula.archiman.presentation.util.conductor.KotlinDialogController
import kotlinx.android.synthetic.main.controller_user.*
import org.koin.standalone.KoinComponent
import org.koin.standalone.inject

class UserInfoController(args: Bundle) : KotlinDialogController(args), KoinComponent {

    override val layoutRes: Int
        get() = R.layout.controller_user

    private val presenter: HomeContract.Presenter by inject()

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
        builder.setPositiveButton(R.string.all_ok) { _, _ -> presenter.onClickOkUserDialog(user) }
        render()
        return builder.create()
    }

    override fun onCancel() {
        super.onCancel()
        presenter.onCancelUserDialog()
    }

    private fun render() {
        tvUserName.text = user.name
    }
}

private const val KEY_USER = "key_user"