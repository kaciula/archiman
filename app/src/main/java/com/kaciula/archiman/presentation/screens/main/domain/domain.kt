package com.kaciula.archiman.presentation.screens.main.domain

/** State definition **/
data class MainModel(
    val isColdStart: Boolean = true
)

/** Things we react to **/
sealed class MainEvent

object ScreenResumed : MainEvent()

/** Things we'll do **/
sealed class MainEffect

data class ShowMessage(val text: String) : MainEffect()
object CheckPlayServices : MainEffect()
