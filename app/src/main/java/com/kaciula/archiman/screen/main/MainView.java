package com.kaciula.archiman.screen.main;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;

import javax.inject.Inject;

public class MainView extends LinearLayout {

    @Inject
    MainPresenter presenter;

    public MainView(Context context, AttributeSet attrs) {
        super(context, attrs);
        if (!isInEditMode())
            ((MainActivity) getContext()).inject(this);
    }

    @Override
    protected void onFinishInflate() {
        super.onFinishInflate();
        if (!isInEditMode()) {
            presenter.setView(this);
            presenter.onInit();
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (!isInEditMode())
            presenter.onAttached();
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (!isInEditMode())
            presenter.onDetached();
    }
}
