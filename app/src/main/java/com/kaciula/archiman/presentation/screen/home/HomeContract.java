package com.kaciula.archiman.presentation.screen.home;

import com.kaciula.archiman.presentation.util.BasePresenter;

public interface HomeContract {

  interface View {

    void render(HomeViewModel viewModel);
  }


  interface Presenter extends BasePresenter {

    void onClickRetry();

    void onClickUser(UserViewModel user);

    void onClickOkUserDialog(UserViewModel user);

    void onCancelUserDialog();
  }
}
