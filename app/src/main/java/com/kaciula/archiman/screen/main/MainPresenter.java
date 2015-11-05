package com.kaciula.archiman.screen.main;

import android.view.View;

import com.kaciula.archiman.ui.BasePresenter;
import com.kaciula.archiman.util.DefaultSubscriber;

import rx.subscriptions.CompositeSubscription;
import timber.log.Timber;

public class MainPresenter extends BasePresenter {

    private MainActivity activity;
    private MainView view;
    private MainMixer mainMixer;

    private final CompositeSubscription subscriptions = new CompositeSubscription();

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
        view.setup();
    }

    @Override
    public void onAttached() {
        Timber.d("onAttached");
        refresh();
    }

    @Override
    public void onDetached() {
        Timber.d("onDetached");
        subscriptions.unsubscribe();
    }

    void onClickRetry() {
        refresh();
    }

    private void refresh() {
        Timber.d("Start refresh");
        view.showProgress();
        subscriptions.add(mainMixer
                .refreshObservable()
                .subscribe(new RefreshSubscriber()));
    }

    private final class RefreshSubscriber extends DefaultSubscriber<MainData> {

        @Override
        public void onError(Throwable e) {
            Timber.d("Received error");
            view.showError();
        }

        @Override
        public void onNext(MainData data) {
            Timber.d("Received next data");
            view.updateContent(data);
            view.showContent();
        }
    }
}
