package com.kaciula.archiman.presentation.screen.main;

import com.google.auto.value.AutoValue;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

import com.kaciula.archiman.data.DataRepository;
import com.kaciula.archiman.domain.model.User;
import com.kaciula.archiman.presentation.util.Toasts;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;

import java.util.List;

import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.functions.Function;
import io.reactivex.observers.DisposableObserver;
import timber.log.Timber;

public class MainPresenter implements MainContract.Presenter {

    private MainContract.Container container;
    private MainContract.View view;
    private BaseSchedulerProvider schedulerProvider;
    private DataRepository dataRepository;

    private final CompositeDisposable disposables;
    private User lastClickedUser;

    public MainPresenter(MainContract.Container container, MainContract.View view,
                         BaseSchedulerProvider schedulerProvider, DataRepository dataRepository) {
        this.container = container;
        this.view = view;
        this.schedulerProvider = schedulerProvider;
        this.dataRepository = dataRepository;
        disposables = new CompositeDisposable();
        this.view.setPresenter(this);
    }

    @Override
    public void start() {
        Timber.d("start");
        view.setup();
        // Do stuff if we have retained state
        if (lastClickedUser != null) {
            Toasts.show("Before orientation change, last user clicked was " + lastClickedUser.toString());
        }
        refresh();
    }

    @Override
    public void stop() {
        Timber.d("stop");
        disposables.dispose();
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
        Toasts.show("Clicked OK on user dialog for user " + user.name());
    }

    private void refresh() {
        Timber.d("Start refresh");
        view.showProgress();

        disposables.add(dataRepository.getUsers()
                .map(new Function<List<User>, MainViewModel>() {
                    @Override
                    public MainViewModel apply(List<User> users) throws Exception {
                        return MainViewModel.create(users);
                    }
                })
                .subscribeOn(schedulerProvider.io())
                .observeOn(schedulerProvider.ui())
                .subscribeWith(new RefreshSubscriber()));
    }

    private final class RefreshSubscriber extends DisposableObserver<MainViewModel> {

        @Override
        public void onNext(MainViewModel mainViewModel) {
            Timber.d("Received next data");
            view.updateContent(mainViewModel);
            view.showContent();
        }

        @Override
        public void onError(Throwable t) {
            Timber.d(t, "Received error");
            view.showError();
        }

        @Override
        public void onComplete() {
            // Do nothing
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
