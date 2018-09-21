package ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.domain

import com.spotify.mobius.*

class ${screenName}Init : Init<${screenName}Model, ${screenName}Effect> {
    override fun init(model: ${screenName}Model): First<${screenName}Model, ${screenName}Effect> {
        return First.first(model)
    }
}


class ${screenName}Update : Update<${screenName}Model, ${screenName}Event, ${screenName}Effect> {

    override fun update(model: ${screenName}Model, event: ${screenName}Event): Next<${screenName}Model, ${screenName}Effect> {
        return when (event) {
        }
    }
}