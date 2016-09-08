package com.kaciula.archiman.injection;

import com.kaciula.archiman.component.ArchimanApplication;
import com.kaciula.archiman.data.DataRepository;
import com.kaciula.archiman.data.remote.GithubApi;
import com.kaciula.archiman.util.AppManager;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;

public interface BaseAppComponent {

    void inject(ArchimanApplication application);

    void inject(AppManager appManager);

    GithubApi githubApi();

    BaseSchedulerProvider schedulerProvider();

    DataRepository dataRepository();
}
