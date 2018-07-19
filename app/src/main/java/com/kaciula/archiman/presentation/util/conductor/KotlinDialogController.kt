package com.kaciula.archiman.presentation.util.conductor

import android.app.Dialog
import android.os.Bundle
import android.view.View
import kotlinx.android.extensions.LayoutContainer
import kotlinx.android.synthetic.*

abstract class KotlinDialogController(args: Bundle = Bundle()) : DialogController(args),
    LayoutContainer {

    abstract val layoutRes: Int

    private var _containerView: View? = null
    override val containerView: View? get() = _containerView

    override fun onCreateDialog(savedViewState: Bundle?): Dialog {
        val view = View.inflate(activity, layoutRes, null).also { _containerView = it }
        return onViewBound(view)
    }

    override fun onDestroyView(view: View) {
        super.onDestroyView(view)
        onViewDestroyed()
        clearFindViewByIdCache()
        _containerView = null
    }

    protected abstract fun onViewBound(view: View): Dialog

    protected open fun onViewDestroyed() {}
}