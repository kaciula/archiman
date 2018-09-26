package com.kaciula.archiman.presentation.screens.home.domain

/** State definition **/
data class HomeModel(
    val isProgress: Boolean = false,
    val isContent: Boolean = false,
    val isError: Boolean = false,
    val error: Throwable? = null
)


/** Things we react to **/
sealed class HomeEvent


/** Things we'll do **/
sealed class HomeEffect
