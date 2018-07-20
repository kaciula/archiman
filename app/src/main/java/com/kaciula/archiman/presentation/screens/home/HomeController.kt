package com.kaciula.archiman.presentation.screens.home

import android.support.v7.widget.LinearLayoutManager
import android.view.View
import com.kaciula.archiman.R
import com.kaciula.archiman.di.KoinParam
import com.kaciula.archiman.di.ScreenContext
import com.kaciula.archiman.presentation.screens.main.Coordinator
import com.kaciula.archiman.presentation.util.base.BaseController
import com.kaciula.archiman.presentation.widgets.DividerItemDecoration
import kotlinx.android.synthetic.main.controller_home.*
import kotlinx.android.synthetic.main.widget_error.*
import org.koin.standalone.inject
import org.koin.standalone.releaseContext
import timber.log.Timber

class HomeController : BaseController(), HomeContract.View {

    override val layoutRes: Int
        get() = R.layout.controller_home

    private val presenter: HomeContract.Presenter by inject { mapOf(KoinParam.VIEW to this) }
    private val coordinator: Coordinator by inject()

    private lateinit var adapter: UserAdapter

    override fun onViewBound(view: View) {
        presenter.onInit()
    }

    override fun onAttach(view: View) {
        super.onAttach(view)
        presenter.onAttach()
    }

    override fun onDetach(view: View) {
        presenter.onDetach()
        super.onDetach(view)
    }

    override fun onDestroy() {
        presenter.onTerminate()
        releaseContext(ScreenContext.HOME)
        super.onDestroy()
    }

    override fun render(state: HomeState) {
        if (state.initialize) {
            recyclerView.addItemDecoration(DividerItemDecoration(activity!!))
            recyclerView.layoutManager =
                    LinearLayoutManager(activity, LinearLayoutManager.VERTICAL, false)
            adapter = UserAdapter(emptyList(), presenter)
            recyclerView.adapter = adapter

            btnRetry.setOnClickListener {
                presenter.onClickRetry()
            }
        }

        if (state.isProgress) {
            flipper.displayedChild = CHILD_PROGRESS
        } else if (state.isError) {
            flipper.displayedChild = CHILD_ERROR
            Timber.w("Encountered an error: ${state.error}")
        } else if (state.isContent) {
            showContent(state)
        }

        if (state.showUserDialog) {
            coordinator.showUserInfo(state.dialogUser!!)
        }
    }

    private fun showContent(state: HomeState) {
        adapter.items = state.users!!
        flipper.displayedChild = CHILD_CONTENT
    }

    override fun goToUserDetailsScreen(user: UserViewModel) {
        coordinator.goToUserDetailsScreen(user)
    }
}

private const val CHILD_CONTENT = 0
private const val CHILD_PROGRESS = 1
private const val CHILD_ERROR = 2
