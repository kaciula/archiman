package com.kaciula.archiman.presentation.util

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import kotlinx.android.extensions.LayoutContainer
import kotlinx.android.synthetic.*

abstract class KotlinView(
    layoutRes: Int,
    inflater: LayoutInflater,
    container: ViewGroup
) : LayoutContainer {

    private var _containerView: View? = inflater.inflate(layoutRes, container, false)
    override val containerView: View? get() = _containerView

    protected open fun tearDown() {
        clearFindViewByIdCache()
        _containerView = null
    }
}