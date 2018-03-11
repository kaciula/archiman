package com.kaciula.archiman.presentation.util.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter

/**
 * An implementation of [BaseAdapter] which uses the new/bind pattern for
 * its views.
 */
abstract class BindableAdapter<T>(val context: Context) : BaseAdapter() {
    private val inflater: LayoutInflater = LayoutInflater.from(context)

    abstract override fun getItem(position: Int): T

    override fun getView(position: Int, view: View?, container: ViewGroup): View {
        var view1 = view
        if (view1 == null) {
            view1 = newView(inflater, position, container)
        }
        bindView(getItem(position), position, view1)
        return view1
    }

    /**
     * Create a new instance of a view for the specified position.
     */
    abstract fun newView(inflater: LayoutInflater, position: Int, container: ViewGroup): View

    /**
     * Bind the data for the specified `position` to the view.
     */
    abstract fun bindView(item: T, position: Int, view: View)

    override fun getDropDownView(position: Int, view: View?, container: ViewGroup): View {
        var view1 = view
        if (view1 == null) {
            view1 = newDropDownView(inflater, position, container)
        }
        bindDropDownView(getItem(position), position, view1)
        return view1
    }

    /**
     * Create a new instance of a drop-down view for the specified position.
     */
    open fun newDropDownView(inflater: LayoutInflater, position: Int, container: ViewGroup): View {
        return newView(inflater, position, container)
    }

    /**
     * Bind the data for the specified `position` to the drop-down view.
     */
    fun bindDropDownView(item: T, position: Int, view: View) {
        bindView(item, position, view)
    }
}
