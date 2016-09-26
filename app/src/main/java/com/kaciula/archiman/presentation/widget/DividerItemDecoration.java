package com.kaciula.archiman.presentation.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;

public class DividerItemDecoration extends RecyclerView.ItemDecoration {

    private Drawable divider;
    private boolean drawLastDivider;

    public DividerItemDecoration(Context context) {
        final TypedArray a = context.obtainStyledAttributes(null, new int[]{android.R.attr
                .listDivider});
        divider = a.getDrawable(0);
        a.recycle();
        drawLastDivider = true;
    }

    public DividerItemDecoration(Context context, boolean drawLastDivider) {
        this(context);
        this.drawLastDivider = drawLastDivider;
    }

    public DividerItemDecoration(Drawable divider) {
        this.divider = divider;
        drawLastDivider = true;
    }

    @Override
    public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State
            state) {
        super.getItemOffsets(outRect, view, parent, state);
        if (divider == null) return;
        if (getOrientation(parent) == LinearLayoutManager.VERTICAL) {
            outRect.bottom = divider.getIntrinsicHeight();
        } else outRect.right = divider.getIntrinsicWidth();
    }

    @Override
    public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
        if (divider == null) {
            super.onDrawOver(c, parent, state);
            return;
        }

        if (getOrientation(parent) == LinearLayoutManager.VERTICAL) {
            final int left = parent.getPaddingLeft();
            final int right = parent.getWidth() - parent.getPaddingRight();
            final int childCount = parent.getChildCount();

            final int count = drawLastDivider ? childCount : childCount - 1;
            for (int i = 0; i < count; i++) {
                final View child = parent.getChildAt(i);
                final RecyclerView.LayoutParams params = (RecyclerView.LayoutParams) child
                        .getLayoutParams();
                final int size = divider.getIntrinsicHeight();
                final int top = child.getBottom() + params.bottomMargin;
                final int bottom = top + size;
                divider.setBounds(left, top, right, bottom);
                divider.draw(c);
            }
        } else { //horizontal
            final int top = parent.getPaddingTop();
            final int bottom = parent.getHeight() - parent.getPaddingBottom();
            final int childCount = parent.getChildCount();

            final int count = drawLastDivider ? childCount : childCount - 1;
            for (int i = 0; i < count; i++) {
                final View child = parent.getChildAt(i);
                final RecyclerView.LayoutParams params = (RecyclerView.LayoutParams) child
                        .getLayoutParams();
                final int size = divider.getIntrinsicWidth();
                final int left = child.getRight() + params.rightMargin;
                final int right = left + size;
                divider.setBounds(left, top, right, bottom);
                divider.draw(c);
            }
        }
    }

    private int getOrientation(RecyclerView parent) {
        if (parent.getLayoutManager() instanceof LinearLayoutManager) {
            LinearLayoutManager layoutManager = (LinearLayoutManager) parent.getLayoutManager();
            return layoutManager.getOrientation();
        } else
            throw new IllegalStateException("DividerItemDecorationOld can only be used with a " +
                    "LinearLayoutManager.");
    }
}