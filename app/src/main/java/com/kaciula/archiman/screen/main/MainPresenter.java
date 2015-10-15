package com.kaciula.archiman.screen.main;

import android.view.View;

import com.kaciula.archiman.ui.BasePresenter;

import timber.log.Timber;

public class MainPresenter extends BasePresenter {

    private MainActivity activity;
    private MainView view;
    private MainMixer mainMixer;

    public MainPresenter(MainActivity activity, MainMixer mainMixer) {
        this.activity = activity;
        this.mainMixer = mainMixer;
    }

    @Override
    public void setView(View view) {
        this.view = (MainView) view;
    }

    @Override
    public void onInit() {
        Timber.d("onInit");
    }

    @Override
    public void onAttached() {
        Timber.d("onAttached");
    }

    @Override
    public void onDetached() {
        Timber.d("onDetached");
    }
}
