package com.kaciula.archiman.injection;

import com.kaciula.archiman.component.ArchimanApplication;
import com.kaciula.archiman.data.remote.GithubApi;
import com.kaciula.archiman.util.AppManager;

public interface BaseAppComponent {

    void inject(ArchimanApplication application);

    void inject(AppManager appManager);

    GithubApi githubApi();
}
