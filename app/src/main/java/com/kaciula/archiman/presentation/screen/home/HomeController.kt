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
import com.kaciula.archiman.injection.Injector
import com.kaciula.archiman.presentation.util.BaseController
import com.kaciula.archiman.presentation.widget.DividerItemDecoration
import timber.log.Timber
import javax.inject.Inject

class HomeController : BaseController(), HomeContract.View {

    @Inject lateinit var presenter: HomeContract.Presenter
    private val component: HomeComponent = DaggerHomeComponent.builder()
            .appComponent(Injector.appComponent)
            .homeModule(HomeModule(this))
            .build()

    @BindView(R.id.flipper) lateinit var flipper: ViewFlipper
    @BindView(R.id.recycler_view) lateinit var recyclerView: RecyclerView

    private lateinit var adapter: UserAdapter

    init {
        component.inject(this)
    }

    fun component(): HomeComponent = component

    override fun inflateView(inflater: LayoutInflater, container: ViewGroup): View =
            inflater.inflate(R.layout.controller_home, container, false)

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

    override fun render(state: HomeState) {
        if (state.initialize) {
            recyclerView.addItemDecoration(DividerItemDecoration(activity!!))
            recyclerView.layoutManager = LinearLayoutManager(activity, LinearLayoutManager.VERTICAL, false)
            adapter = UserAdapter(activity!!, emptyList(), presenter)
            recyclerView.adapter = adapter
        }

        if (state.isProgress) {
            flipper.displayedChild = CHILD_PROGRESS
        } else if (state.isError) {
            flipper.displayedChild = CHILD_ERROR
            Timber.w("Encountered an error: ${state.error}")
        } else if (state.showUserDialog) {
            showContent(state)
            if (!state.isRecreate) {
                getDialogShowman().show(UserDialogFragment.newInstance(state.dialogUser!!))
            }
        } else if (state.isContent) {
            showContent(state)
        }
    }

    private fun showContent(state: HomeState) {
        adapter.items = state.users!!
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
