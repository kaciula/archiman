package com.kaciula.archiman.screen.main;

import com.kaciula.archiman.data.model.User;
import com.kaciula.archiman.ui.BasePresenter;
import com.kaciula.archiman.ui.BaseView;

public interface MainContract {

    interface View extends BaseView<Presenter> {

        void updateContent(MainData data);

        void showContent();

        void showProgress();

        void showError();

        void showMessageOnClick(User user);
    }

    interface Container {

    }

    interface Presenter extends BasePresenter {

        void onClickRetry();

        void onClickUser(User user);
    }
}
