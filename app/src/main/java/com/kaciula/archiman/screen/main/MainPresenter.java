package com.kaciula.archiman.screen.main;

import com.kaciula.archiman.data.model.User;
import com.kaciula.archiman.data.remote.GithubApi;
import com.kaciula.archiman.data.remote.converter.UserResponseListConverter;
import com.kaciula.archiman.util.DefaultSubscriber;

import java.util.List;

import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Func1;
import rx.schedulers.Schedulers;
import rx.subscriptions.CompositeSubscription;
import timber.log.Timber;

public class MainPresenter implements MainContract.Presenter {

    private MainContract.Container container;
    private MainContract.View view;
    private GithubApi githubApi;

    private final CompositeSubscription subscriptions = new CompositeSubscription();

    public MainPresenter(MainContract.Container container, MainContract.View view, GithubApi
            githubApi) {
        this.container = container;
        this.view = view;
        this.githubApi = githubApi;
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

        final String ORGANISATION_NAME = "square";
        subscriptions.add(githubApi.getMembers(ORGANISATION_NAME)
                .map(UserResponseListConverter.instance())
                .map(new Func1<List<User>, MainData>() {
                    @Override
                    public MainData call(List<User> users) {
                        MainData data = new MainData();
                        data.users = users;
                        return data;
                    }
                })
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
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
