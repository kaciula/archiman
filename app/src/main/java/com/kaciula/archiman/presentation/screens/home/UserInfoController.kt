package com.kaciula.archiman.presentation.screens.home

import android.app.AlertDialog
import android.app.Dialog
import android.os.Bundle
import android.view.View
import android.widget.TextView
import butterknife.BindView
import butterknife.ButterKnife
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.screens.main.MainActivity
import com.kaciula.archiman.presentation.util.conductor.BundleBuilder
import com.kaciula.archiman.presentation.util.conductor.DialogController
import javax.inject.Inject

class UserInfoController(args: Bundle) : DialogController(args) {

    @Inject
    lateinit var presenter: HomeContract.Presenter

    private val user: UserViewModel = args.getParcelable(KEY_USER)

    @BindView(R.id.tv_user_name)
    lateinit var tvUserName: TextView

    constructor(user: UserViewModel) : this(
        BundleBuilder(Bundle())
            .putParcelable(KEY_USER, user)
            .build()
    )

    override fun onCreateDialog(savedViewState: Bundle?): Dialog {
        (activity as MainActivity).getHomeComponent().inject(this)
        val builder = AlertDialog.Builder(activity)
        builder.setTitle(user.name)
        val view = View.inflate(activity, R.layout.controller_user, null)
        ButterKnife.bind(this, view)
        builder.setView(view)
        builder.setPositiveButton(R.string.all_ok) { _, _ -> presenter.onClickOkUserDialog(user) }
        render()
        return builder.create()
    }

    private fun render() {
        tvUserName.text = user.name
    }
}

private const val KEY_USER = "key_user"