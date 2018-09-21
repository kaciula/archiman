package ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.view

import android.app.Activity
import android.view.LayoutInflater
import android.view.ViewGroup
import ${mainSourceSetPackage}.R
import ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.domain.${screenName}Event
import ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.domain.${screenName}Model
import ${mainSourceSetPackage}.presentation.util.KotlinView
import com.spotify.mobius.Connectable
import com.spotify.mobius.Connection
import com.spotify.mobius.functions.Consumer
import kotlinx.android.synthetic.main.${controllerLayout}.*

class ${screenName}View(
    inflater: LayoutInflater,
    container: ViewGroup,
    private val activity: Activity
) : KotlinView(R.layout.${controllerLayout}, inflater, container),
    Connectable<${screenName}Model, ${screenName}Event> {

    override fun connect(output: Consumer<${screenName}Event>): Connection<${screenName}Model> {
        initialize(output)

        return object : Connection<${screenName}Model> {
            override fun accept(value: ${screenName}Model) {
                render(value)
            }

            override fun dispose() {
                tearDown()
            }
        }
    }

    private fun initialize(output: Consumer<${screenName}Event>) {
    }

    private fun render(model: ${screenName}Model) {
    }

    override fun tearDown() {
        super.tearDown()
    }
}