package com.kaciula.archiman.presentation.screen.main;

import com.kaciula.archiman.domain.model.User;
import com.kaciula.archiman.presentation.util.BasePresenter;
import com.kaciula.archiman.presentation.util.BaseView;

public interface MainContract {

    interface View extends BaseView<Presenter> {

        void updateContent(MainViewModel data);

        void showContent();

        void showProgress();

        void showError();

        void setup();
    }

    interface Container {
        void showUserDialog(User user);
    }

    interface Presenter extends BasePresenter {

        void onClickRetry();

        void onClickUser(User user);

        void onClickOkUserDialog(User user);
    }
}
