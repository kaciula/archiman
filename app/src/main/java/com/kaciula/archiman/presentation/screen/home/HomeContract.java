package com.kaciula.archiman.presentation.screen.home;

import com.kaciula.archiman.presentation.util.BasePresenter;

public interface HomeContract {

  interface View {

    void updateContent(HomeViewModel data);

    void showContent();

    void showProgress();

    void showError();

    void showUserDialog(UserViewModel user);

    void showUserMessage(UserViewModel user);

    void setup();
  }


  interface Presenter extends BasePresenter {

    void onClickRetry();

    void onClickUser(UserViewModel user);

    void onClickOkUserDialog(UserViewModel user);
  }
}
