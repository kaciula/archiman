package com.kaciula.archiman.presentation.screens.home

import android.app.Activity
import android.os.Looper
import android.support.v7.widget.LinearLayoutManager
import android.view.LayoutInflater
import android.view.ViewGroup
import com.kaciula.archiman.R
import com.kaciula.archiman.presentation.util.KotlinView
import com.kaciula.archiman.presentation.widgets.DividerItemDecoration
import com.spotify.mobius.Connectable
import com.spotify.mobius.Connection
import com.spotify.mobius.functions.Consumer
import kotlinx.android.synthetic.main.controller_home.*
import kotlinx.android.synthetic.main.widget_error.*
import timber.log.Timber

class HomeView(
    inflater: LayoutInflater,
    container: ViewGroup,
    private val activity: Activity
) : KotlinView(R.layout.controller_home, inflater, container),
    Connectable<HomeModel, HomeEvent> {

    private lateinit var output: Consumer<HomeEvent>

    private lateinit var adapter: UserAdapter

    override fun connect(output: Consumer<HomeEvent>): Connection<HomeModel> {
        initialize(output)

        return object : Connection<HomeModel> {
            override fun accept(value: HomeModel) {
                render(value)
            }

            override fun dispose() {
                tearDown()
            }
        }
    }

    private fun initialize(output: Consumer<HomeEvent>) {
        this.output = output
        recyclerView.addItemDecoration(DividerItemDecoration(activity))
        recyclerView.layoutManager =
                LinearLayoutManager(activity, LinearLayoutManager.VERTICAL, false)
        adapter = UserAdapter(emptyList(), output)
        recyclerView.adapter = adapter

        btnRetry.setOnClickListener { output.accept(GetUsersRequested) }
    }

    private fun render(model: HomeModel) {
        Timber.d("Render home thread ${Looper.myLooper() === Looper.getMainLooper()}")
        if (model.isProgress) {
            flipper.displayedChild = CHILD_PROGRESS
        } else if (model.isError) {
            flipper.displayedChild = CHILD_ERROR
            Timber.w("Encountered an error: ${model.error}")
        } else if (model.isContent) {
            Timber.d("Render home content")
            renderContent(model)
        }
    }

    private fun renderContent(model: HomeModel) {
        adapter.setItems(model.users!!)
        flipper.displayedChild = CHILD_CONTENT
    }

    override fun tearDown() {
        btnRetry.setOnClickListener(null)
        super.tearDown()
    }
}

private const val CHILD_CONTENT = 0
private const val CHILD_PROGRESS = 1
private const val CHILD_ERROR = 2
