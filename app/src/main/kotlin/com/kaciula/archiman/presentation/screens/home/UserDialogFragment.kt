package com.kaciula.archiman.presentation.screens.home

import android.app.Dialog
import android.content.DialogInterface
import android.os.Bundle
import android.support.v7.app.AlertDialog
import android.support.v7.app.AppCompatDialogFragment
import android.view.View
import android.widget.TextView
import butterknife.BindView
import butterknife.ButterKnife
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.screens.main.ComponentProvider
import javax.inject.Inject

class UserDialogFragment : AppCompatDialogFragment() {

    @Inject lateinit var presenter: HomeContract.Presenter

    @BindView(R.id.tv_user_name) lateinit var tvUserName: TextView

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        (activity as ComponentProvider).getHomeComponent().inject(this)
    }

    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {
        val builder = AlertDialog.Builder(activity)
        builder.setTitle(user().name)

        val view = View.inflate(activity, R.layout.dialog_user, null)
        ButterKnife.bind(this, view)
        setup()
        builder.setView(view)
        builder.setPositiveButton(R.string.all_ok) { _, _ -> presenter.onClickOkUserDialog(user()) }
        return builder.create()
    }

    override fun onCancel(dialog: DialogInterface?) {
        super.onCancel(dialog)
        presenter.onCancelUserDialog()
    }

    private fun setup() {
        tvUserName.text = user().name
    }

    private fun user(): UserViewModel {
        return arguments.getParcelable<UserViewModel>(EXTRA_USER)
    }

    companion object {

        private val EXTRA_USER = "user"

        fun newInstance(user: UserViewModel): UserDialogFragment {
            val fragment = UserDialogFragment()
            val args = Bundle()
            args.putParcelable(EXTRA_USER, user)
            fragment.arguments = args
            return fragment
        }
    }
}
