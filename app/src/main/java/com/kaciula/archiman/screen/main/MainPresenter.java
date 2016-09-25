package com.kaciula.archiman.screen.main;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

import com.google.auto.value.AutoValue;
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

    private final CompositeSubscription subscriptions;
    private User lastClickedUser;

    public MainPresenter(MainContract.Container container, MainContract.View view,
                         BaseSchedulerProvider schedulerProvider, DataRepository dataRepository) {
        this.container = container;
        this.view = view;
        this.schedulerProvider = schedulerProvider;
        this.dataRepository = dataRepository;
        subscriptions = new CompositeSubscription();
        this.view.setPresenter(this);
    }

    @Override
    public void start() {
        Timber.d("start");
        // Do stuff if we have retained state
        if (lastClickedUser != null) {
            Toasts.show("Before orientation change, last user clicked was " + lastClickedUser
                    .toString());
        }
        refresh();
    }

    @Override
    public void stop() {
        Timber.d("stop");
        subscriptions.unsubscribe();
    }

    @Override
    public Object getRetainedState() {
        return State.create(lastClickedUser);
    }

    @Override
    public void setRetainedState(@NonNull Object object) {
        State state = (State) object;
        lastClickedUser = state.lastClickedUser();
    }

    @Override
    public void onClickRetry() {
        refresh();
    }

    @Override
    public void onClickUser(User user) {
        container.showUserDialog(user);
        lastClickedUser = user;
    }

    @Override
    public void onClickOkUserDialog(User user) {
        Toasts.show("Clicked OK on user dialog for user " + user.username());
    }

    private void refresh() {
        Timber.d("Start refresh");
        view.showProgress();

        subscriptions.add(dataRepository.getMembersOfOrganisation("square")
                .map(new Func1<List<User>, MainViewModel>() {
                    @Override
                    public MainViewModel call(List<User> users) {
                        return MainViewModel.create(users);
                    }
                })
                .subscribeOn(schedulerProvider.io())
                .observeOn(schedulerProvider.ui())
                .subscribe(new RefreshSubscriber()));
    }

    private final class RefreshSubscriber extends DefaultSubscriber<MainViewModel> {

        @Override
        public void onError(Throwable e) {
            Timber.d("Received error");
            view.showError();
        }

        @Override
        public void onNext(MainViewModel data) {
            Timber.d("Received next data");
            view.updateContent(data);
            view.showContent();
        }
    }

    @AutoValue
    static abstract class State {
        @Nullable
        public abstract User lastClickedUser();

        public static State create(@Nullable User lastClickedUser) {
            return new AutoValue_MainPresenter_State(lastClickedUser);
        }
    }
}
