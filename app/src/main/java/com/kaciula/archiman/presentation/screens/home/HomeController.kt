package com.kaciula.archiman.presentation.screens.home

import android.os.Looper
import android.support.v7.widget.LinearLayoutManager
import android.view.View
import android.widget.Toast
import com.kaciula.archiman.R
import com.kaciula.archiman.di.ScreenContext
import com.kaciula.archiman.infrastructure.util.MobiusLogger
import com.kaciula.archiman.presentation.util.base.BaseController
import com.kaciula.archiman.presentation.widgets.DividerItemDecoration
import com.spotify.mobius.Connectable
import com.spotify.mobius.Connection
import com.spotify.mobius.android.MobiusAndroid
import com.spotify.mobius.functions.Consumer
import com.spotify.mobius.rx2.RxMobius
import kotlinx.android.synthetic.main.controller_home.*
import kotlinx.android.synthetic.main.widget_error.*
import org.koin.standalone.inject
import org.koin.standalone.releaseContext
import timber.log.Timber

class HomeController : BaseController(), Connectable<HomeModel, HomeEvent> {

    override val layoutRes: Int
        get() = R.layout.controller_home

    private val effectHandlers: HomeEffectHandlers by inject()

    private val loopFactory = RxMobius
        .loop(HomeUpdate(), effectHandlers.build())
        .init(HomeInit())
        .logger(MobiusLogger())
    private val controller = MobiusAndroid
        .controller(loopFactory, HomeModel())
    private lateinit var output: Consumer<HomeEvent>

    private lateinit var adapter: UserAdapter

    override fun onViewBound(view: View) {
        controller.connect(this)
        controller.start()
    }

    override fun onViewDestroyed() {
        controller.stop()
        controller.disconnect()
        super.onViewDestroyed()
    }

    override fun onDestroy() {
        releaseContext(ScreenContext.HOME)
        super.onDestroy()
    }

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

    fun dialogRouter() = getChildRouter(containerDialogs)

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

    private fun initialize(output: Consumer<HomeEvent>) {
        this.output = output
        recyclerView.addItemDecoration(DividerItemDecoration(activity!!))
        recyclerView.layoutManager =
                LinearLayoutManager(activity, LinearLayoutManager.VERTICAL, false)
        adapter = UserAdapter(emptyList(), output)
        recyclerView.adapter = adapter

        btnRetry.setOnClickListener { output.accept(GetUsersRequested) }
    }

    private fun tearDown() {
        btnRetry.setOnClickListener(null)
    }

    private fun renderContent(model: HomeModel) {
        adapter.setItems(model.users!!)
        flipper.displayedChild = CHILD_CONTENT
    }

    fun onCancelUserInfoDialog() {
        Toast.makeText(activity, "Cancelled user info dialog", Toast.LENGTH_SHORT).show()
    }

    fun onClickOkUserInfoDialog(user: UserViewModel) {
        output.accept(UserInfoDialogOkClicked(user))
    }
}

private const val CHILD_CONTENT = 0
private const val CHILD_PROGRESS = 1
private const val CHILD_ERROR = 2
