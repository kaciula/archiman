package com.kaciula.archiman.screen.main;

import com.kaciula.archiman.util.DefaultSubscriber;

import rx.subscriptions.CompositeSubscription;
import timber.log.Timber;

public class MainPresenter implements MainContract.Presenter {

    private MainContract.Container container;
    private MainContract.View view;
    private MainMixer mainMixer;

    private final CompositeSubscription subscriptions = new CompositeSubscription();

    public MainPresenter(MainContract.Container container, MainContract.View view, MainMixer
            mainMixer) {
        this.container = container;
        this.view = view;
        this.mainMixer = mainMixer;
        this.view.setPresenter(this);
    }

    @Override
    public void attachView() {
        Timber.d("attachView");
        refresh();
    }

    @Override
    public void detachView() {
        Timber.d("detachView");
        subscriptions.unsubscribe();
    }

    @Override
    public void onClickRetry() {
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
