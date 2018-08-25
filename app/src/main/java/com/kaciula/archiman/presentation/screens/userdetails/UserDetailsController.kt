package com.kaciula.archiman.presentation.screens.userdetails

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.kaciula.archiman.di.KoinParam
import com.kaciula.archiman.di.ScreenContext
import com.kaciula.archiman.infrastructure.util.MobiusLogger
import com.kaciula.archiman.presentation.screens.home.UserViewModel
import com.kaciula.archiman.presentation.util.base.BaseController
import com.kaciula.archiman.presentation.util.conductor.BundleBuilder
import com.spotify.mobius.android.MobiusAndroid
import com.spotify.mobius.rx2.RxEventSources
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.subjects.PublishSubject
import org.koin.standalone.inject
import org.koin.standalone.releaseContext

class UserDetailsController(args: Bundle) : BaseController(args) {

    private val user = args.getParcelable<UserViewModel>(KEY_USER)

    private val effectHandlers: UserDetailsEffectHandlers by inject { mapOf(KoinParam.CONTROLLER to this) }

    private val eventSource: PublishSubject<UserDetailsEvent> = PublishSubject.create()

    private val loopFactory = RxMobius
        .loop(UserDetailsUpdate(), effectHandlers.build())
        .init(UserDetailsInit())
        .eventSource(RxEventSources.fromObservables(eventSource))
        .logger(MobiusLogger())
    private val controller = MobiusAndroid
        .controller(loopFactory, UserDetailsModel(userName = user.name))

    constructor(user: UserViewModel) : this(
        BundleBuilder(Bundle())
            .putParcelable(KEY_USER, user)
            .build()
    )

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup): View {
        val theView = UserDetailsView(inflater, container)
        controller.connect(theView)
        controller.start()
        return theView.containerView!!
    }

    override fun onDestroyView(view: View) {
        controller.stop()
        controller.disconnect()
        super.onDestroyView(view)
    }

    override fun onDestroy() {
        releaseContext(ScreenContext.USER_DETAILS)
        super.onDestroy()
    }

    fun publishEvent(event: UserDetailsEvent) {
        eventSource.onNext(event)
    }
}

private const val KEY_USER = "key.user"
