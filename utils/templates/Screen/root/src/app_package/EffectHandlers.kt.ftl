package ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.effecthandlers

import ${mainSourceSetPackage}.boundary.SchedulerProvider
import ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.domain.${screenName}Effect
import ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.domain.${screenName}Event
import ${mainSourceSetPackage}.presentation.screens.main.Coordinator
import com.spotify.mobius.rx2.RxMobius
import io.reactivex.ObservableTransformer

class ${screenName}EffectHandlers(
    private val schedulerProvider: SchedulerProvider,
    private val coordinator: Coordinator
) {

    fun build(): ObservableTransformer<${screenName}Effect, ${screenName}Event> {
        return RxMobius
            .subtypeEffectHandler<${screenName}Effect, ${screenName}Event>()
            .build()
    }
}