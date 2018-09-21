package ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import ${mainSourceSetPackage}.di.ScreenContext
import ${mainSourceSetPackage}.infrastructure.util.MobiusLogger
import ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.domain.${screenName}Event
import ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.domain.${screenName}Init
import ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.domain.${screenName}Model
import ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.domain.${screenName}Update
import ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.effecthandlers.${screenName}EffectHandlers
import ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.view.${screenName}View
import ${mainSourceSetPackage}.presentation.util.conductor.BaseController
import com.spotify.mobius.android.MobiusAndroid
import com.spotify.mobius.rx2.RxEventSources
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.subjects.PublishSubject
import org.koin.standalone.inject
import org.koin.standalone.releaseContext

class ${screenName}Controller : BaseController() {

    private val effectHandlers: ${screenName}EffectHandlers by inject()

    private val eventSource: PublishSubject<${screenName}Event> = PublishSubject.create()

    private val loopFactory = RxMobius
        .loop(${screenName}Update(), effectHandlers.build())
        .init(${screenName}Init())
        .eventSource(RxEventSources.fromObservables(eventSource))
        .logger(MobiusLogger("${screenName}"))

    private val controller = MobiusAndroid.controller(loopFactory, ${screenName}Model)

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup): View {
        val theView = ${screenName}View(inflater, container, activity!!)
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
        releaseContext(ScreenContext.${screenName?upper_case})
        super.onDestroy()
    }

    fun publishEvent(event: ${screenName}Event) {
        eventSource.onNext(event)
    }
}