package com.kaciula.archiman.presentation.screen.home

import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ViewFlipper
import butterknife.BindView
import butterknife.OnClick
import com.kaciula.archiman.R
import com.kaciula.archiman.infrastructure.ArchimanApplication
import com.kaciula.archiman.presentation.util.BaseController
import com.kaciula.archiman.presentation.widget.DividerItemDecoration
import java.util.*
import javax.inject.Inject

class HomeController : BaseController(), HomeContract.View {

    @Inject lateinit var presenter: HomeContract.Presenter
    private val component: HomeComponent = DaggerHomeComponent.builder()
            .appComponent(ArchimanApplication.component())
            .homeModule(HomeModule(this))
            .build()

    @BindView(R.id.flipper) lateinit var flipper: ViewFlipper
    @BindView(R.id.recycler_view) lateinit var recyclerView: RecyclerView

    private lateinit var adapter: UserAdapter

    init {
        component.inject(this)
    }

    fun component(): HomeComponent {
        return component
    }

    override fun inflateView(inflater: LayoutInflater, container: ViewGroup): View {
        return inflater.inflate(R.layout.controller_home, container, false)
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

    override fun render(viewModel: HomeViewModel) {
        if (viewModel.initialize()) {
            recyclerView.addItemDecoration(DividerItemDecoration(activity))
            recyclerView.layoutManager = LinearLayoutManager(activity, LinearLayoutManager.VERTICAL, false)
            adapter = UserAdapter(activity!!, ArrayList<UserViewModel>(), presenter)
            recyclerView.adapter = adapter
        }

        if (viewModel.isProgress) {
            flipper.displayedChild = CHILD_PROGRESS
        } else if (viewModel.isError) {
            flipper.displayedChild = CHILD_ERROR
        } else if (viewModel.showUserDialog()) {
            showContent(viewModel)
            if (!viewModel.isRecreate) {
                getDialogShowman().show(UserDialogFragment.newInstance(viewModel.dialogUser()))
            }
        } else if (viewModel.isContent) {
            showContent(viewModel)
        }
    }

    private fun showContent(viewModel: HomeViewModel) {
        adapter.items = viewModel.users()
        flipper.displayedChild = CHILD_CONTENT
    }

    @OnClick(R.id.btn_retry)
    fun onClickRetry() {
        presenter.onClickRetry()
    }

    override fun goToUserDetailsScreen(user: UserViewModel) {
        getNavigator().goToUserDetailsScreen(user)
    }

    companion object {

        private val CHILD_CONTENT = 0
        private val CHILD_PROGRESS = 1
        private val CHILD_ERROR = 2
    }
}
