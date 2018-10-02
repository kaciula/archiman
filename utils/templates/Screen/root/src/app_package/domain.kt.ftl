package ${mainSourceSetPackage}.presentation.screens.${screenName?lower_case}.domain

/** State definition **/
object ${screenName}Model


/** Things we react to **/
sealed class ${screenName}Event {
    override fun toString(): String {
        return this.javaClass.simpleName
    }
}


/** Things we'll do **/
sealed class ${screenName}Effect {
    override fun toString(): String {
        return this.javaClass.simpleName
    }
}

