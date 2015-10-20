package com.kaciula.archiman.screen.main;

import com.kaciula.archiman.model.User;
import com.kaciula.archiman.net.GithubApi;
import com.kaciula.archiman.net.converter.UserResponseListConverter;

import java.util.List;

import rx.Observable;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Func1;
import rx.schedulers.Schedulers;

public class MainMixer {

    private GithubApi githubApi;

    public MainMixer(GithubApi githubApi) {
        this.githubApi = githubApi;
    }

    public Observable<MainData> refreshObservable() {
        final String ORGANISATION_NAME = "square";
        return githubApi.getMembers(ORGANISATION_NAME)
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
                .observeOn(AndroidSchedulers.mainThread());
    }
}
