package com.kaciula.archiman.presentation.screen.home;

import com.kaciula.archiman.presentation.screen.main.Container;
import com.kaciula.archiman.presentation.util.BasePresenter;

public interface HomeContract {

  interface View {

    void updateContent(HomeViewModel data);

    void showContent();

    void showProgress();

    void showError();

    void setup();
  }


  interface Presenter extends BasePresenter {

    void setContainer(Container container);

    void onClickRetry();

    void onClickUser(UserViewModel user);

    void onClickOkUserDialog(UserViewModel user);
  }
}
