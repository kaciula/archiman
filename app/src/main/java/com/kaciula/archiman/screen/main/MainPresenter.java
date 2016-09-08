package com.kaciula.archiman.screen.main;

import com.kaciula.archiman.data.DataRepository;
import com.kaciula.archiman.data.model.User;
import com.kaciula.archiman.util.DefaultSubscriber;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;

import java.util.List;

import rx.functions.Func1;
import rx.subscriptions.CompositeSubscription;
import timber.log.Timber;

public class MainPresenter implements MainContract.Presenter {

    private MainContract.Container container;
    private MainContract.View view;
    private BaseSchedulerProvider schedulerProvider;
    private DataRepository dataRepository;

    private final CompositeSubscription subscriptions = new CompositeSubscription();

    public MainPresenter(MainContract.Container container, MainContract.View view,
                         BaseSchedulerProvider schedulerProvider, DataRepository dataRepository) {
        this.container = container;
        this.view = view;
        this.schedulerProvider = schedulerProvider;
        this.dataRepository = dataRepository;
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

    @Override
    public void onClickUser(User user) {
        view.showMessageOnClick(user);
    }

    private void refresh() {
        Timber.d("Start refresh");
        view.showProgress();

        subscriptions.add(dataRepository.getMembersOfOrganisation("square")
                .map(new Func1<List<User>, MainData>() {
                    @Override
                    public MainData call(List<User> users) {
                        MainData data = new MainData();
                        data.users = users;
                        return data;
                    }
                })
                .subscribeOn(schedulerProvider.io())
                .observeOn(schedulerProvider.ui())
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
