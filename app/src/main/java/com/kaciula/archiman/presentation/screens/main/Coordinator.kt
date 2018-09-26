package com.kaciula.archiman.presentation.screens.main

interface Coordinator {

    fun start()

    fun showHome()

    fun handleBack(): Boolean

    fun showToast(text: String)
}
