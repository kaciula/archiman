package com.kaciula.archiman.screen.main;

import android.view.View;

import com.kaciula.archiman.ui.BasePresenter;

import rx.Observable;
import rx.functions.Action1;
import rx.functions.Func1;
import rx.subjects.PublishSubject;
import rx.subscriptions.CompositeSubscription;
import timber.log.Timber;

public class MainPresenter extends BasePresenter {

    private MainActivity activity;
    private MainView view;
    private MainMixer mainMixer;

    private final CompositeSubscription subscriptions = new CompositeSubscription();
    private PublishSubject<Object> subject = PublishSubject.create();

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

        Observable<MainData> observable = subject.flatMap(new Func1<Object,
                Observable<MainData>>() {
            @Override
            public Observable<MainData> call(Object o) {
                Timber.d("called flatMap");
                return mainMixer.refreshObservable()
                        .doOnError(onErrorRefresh)
                        .onErrorResumeNext(Observable.<MainData>empty());
            }
        });
        subscriptions.add(observable.subscribe(onNextRefresh));
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
        subject.onNext(null);
    }

    private final Action1<Throwable> onErrorRefresh = new Action1<Throwable>() {
        @Override
        public void call(Throwable throwable) {
            Timber.d("Received error");
            view.showError();
        }
    };

    private Action1<MainData> onNextRefresh = new Action1<MainData>() {
        @Override
        public void call(MainData data) {
            Timber.d("Received next data");
            view.updateContent(data);
            view.showContent();
        }
    };
}
