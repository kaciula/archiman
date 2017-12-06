package com.kaciula.archiman.presentation.widgets

import android.content.Context
import android.graphics.Canvas
import android.graphics.Rect
import android.graphics.drawable.Drawable
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.View

class DividerItemDecoration : RecyclerView.ItemDecoration {

    private var divider: Drawable
    private var drawLastDivider: Boolean = false

    constructor(context: Context) {
        val a = context.obtainStyledAttributes(null, intArrayOf(android.R.attr.listDivider))
        divider = a.getDrawable(0)
        a.recycle()
        drawLastDivider = true
    }

    constructor(context: Context, drawLastDivider: Boolean) : this(context) {
        this.drawLastDivider = drawLastDivider
    }

    constructor(divider: Drawable) {
        this.divider = divider
        drawLastDivider = true
    }

    override fun getItemOffsets(outRect: Rect, view: View, parent: RecyclerView,
                                state: RecyclerView.State?) {
        super.getItemOffsets(outRect, view, parent, state)
        if (getOrientation(parent) == LinearLayoutManager.VERTICAL) {
            outRect.bottom = divider.intrinsicHeight
        } else {
            outRect.right = divider.intrinsicWidth
        }
    }

    override fun onDrawOver(canvas: Canvas, parent: RecyclerView, state: RecyclerView.State?) {
        if (getOrientation(parent) == LinearLayoutManager.VERTICAL) {
            val left = parent.paddingLeft
            val right = parent.width - parent.paddingRight
            val childCount = parent.childCount

            val count = if (drawLastDivider) childCount else childCount - 1
            for (i in 0..count - 1) {
                val child = parent.getChildAt(i)
                val params = child.layoutParams as RecyclerView.LayoutParams
                val size = divider.intrinsicHeight
                val top = child.bottom + params.bottomMargin
                val bottom = top + size
                divider.setBounds(left, top, right, bottom)
                divider.draw(canvas)
            }
        } else { //horizontal
            val top = parent.paddingTop
            val bottom = parent.height - parent.paddingBottom
            val childCount = parent.childCount

            val count = if (drawLastDivider) childCount else childCount - 1
            for (i in 0..count - 1) {
                val child = parent.getChildAt(i)
                val params = child.layoutParams as RecyclerView.LayoutParams
                val size = divider.intrinsicWidth
                val left = child.right + params.rightMargin
                val right = left + size
                divider.setBounds(left, top, right, bottom)
                divider.draw(canvas)
            }
        }
    }

    private fun getOrientation(parent: RecyclerView): Int {
        if (parent.layoutManager is LinearLayoutManager) {
            val layoutManager = parent.layoutManager as LinearLayoutManager
            return layoutManager.orientation
        } else {
            throw IllegalStateException(
                    "DividerItemDecoration can only be used with a LinearLayoutManager.")
        }
    }
}