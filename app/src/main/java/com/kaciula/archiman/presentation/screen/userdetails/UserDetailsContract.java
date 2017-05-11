package com.kaciula.archiman.presentation.screen.userdetails;

import com.kaciula.archiman.presentation.util.BasePresenter;

interface UserDetailsContract {

  interface View {
    void render(UserDetailsViewModel viewModel);
  }


  interface Presenter extends BasePresenter {

  }
}
