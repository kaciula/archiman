package com.kaciula.archiman.presentation.screens.userdetails

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import butterknife.BindView
import com.kaciula.archiman.R
import com.kaciula.archiman.injection.Injector
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.util.BaseController
import com.kaciula.archiman.presentation.util.BundleBuilder
import javax.inject.Inject

class UserDetailsController(args: Bundle) : BaseController(args), UserDetailsContract.View {

    @Inject lateinit var presenter: UserDetailsContract.Presenter
    private val component: UserDetailsComponent

    @BindView(R.id.tv_user_name) lateinit var tvUserName: TextView

    init {
        val user = getArgs().getParcelable<UserViewModel>(KEY_USER)

        component = DaggerUserDetailsComponent.builder()
                .appComponent(Injector.appComponent)
                .userDetailsModule(UserDetailsModule(this, user!!))
                .build()
        component.inject(this)
    }

    constructor(user: UserViewModel) : this(BundleBuilder(Bundle()).putParcelable(KEY_USER, user).build())

    fun component(): UserDetailsComponent {
        return component
    }

    override fun inflateView(inflater: LayoutInflater, container: ViewGroup): View {
        return inflater.inflate(R.layout.controller_user_details, container, false)
    }

    override fun onViewBound(view: View) {
        presenter.init()
    }

    override fun onAttach(view: View) {
        super.onAttach(view)
        presenter.start()
    }

    override fun onDetach(view: View) {
        presenter.stop()
        super.onDetach(view)
    }

    override fun onDestroy() {
        presenter.destroy()
        super.onDestroy()
    }

    override fun render(state: UserDetailsState) {
        tvUserName.text = state.userName
    }

    companion object {

        private val KEY_USER = "key.user"
    }
}
