package com.kaciula.archiman.screen.main;

import com.kaciula.archiman.data.DataRepository;
import com.kaciula.archiman.data.model.User;
import com.kaciula.archiman.ui.Toasts;
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
    public void start() {
        Timber.d("start");
        refresh();
    }

    @Override
    public void stop() {
        Timber.d("stop");
        subscriptions.unsubscribe();
    }

    @Override
    public void onClickRetry() {
        refresh();
    }

    @Override
    public void onClickUser(User user) {
        container.showUserDialog(user);
    }

    @Override
    public void onClickOkUserDialog(User user) {
        Toasts.show("Clicked OK on user dialog for user " + user.username());
    }

    private void refresh() {
        Timber.d("Start refresh");
        view.showProgress();

        subscriptions.add(dataRepository.getMembersOfOrganisation("square")
                .map(new Func1<List<User>, MainData>() {
                    @Override
                    public MainData call(List<User> users) {
                        return MainData.create(users);
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
