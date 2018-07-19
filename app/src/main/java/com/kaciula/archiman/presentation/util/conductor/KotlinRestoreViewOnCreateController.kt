package com.kaciula.archiman.presentation.util.conductor

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.bluelinelabs.conductor.RestoreViewOnCreateController
import kotlinx.android.extensions.LayoutContainer
import kotlinx.android.synthetic.*

abstract class KotlinRestoreViewOnCreateController(args: Bundle = Bundle()) :
    RestoreViewOnCreateController(args),
    LayoutContainer {

    abstract val layoutRes: Int

    private var _containerView: View? = null
    override val containerView: View? get() = _containerView

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup,
        savedViewState: Bundle?
    ): View {
        val view = inflater.inflate(layoutRes, container, false)
            .also { _containerView = it }
        onViewBound(view, savedViewState)
        return view
    }

    final override fun onDestroyView(view: View) {
        super.onDestroyView(view)
        onViewDestroyed()
        clearFindViewByIdCache()
        _containerView = null
    }

    protected open fun onViewBound(view: View, savedViewState: Bundle?) {}

    protected open fun onViewDestroyed() {}
}
