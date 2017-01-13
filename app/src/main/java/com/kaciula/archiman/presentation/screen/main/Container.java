package com.kaciula.archiman.presentation.screen.main;

import com.kaciula.archiman.presentation.screen.home.UserViewModel;

public interface Container {
  void showUserDialog(UserViewModel user);

  void showUserMessage(UserViewModel user);
}
