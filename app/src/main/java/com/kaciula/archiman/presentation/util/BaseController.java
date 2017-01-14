package com.kaciula.archiman.presentation.util;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.ActionBar;
import android.view.View;
import com.bluelinelabs.conductor.Controller;
import com.kaciula.archiman.presentation.screen.main.ActionBarProvider;
import com.kaciula.archiman.presentation.screen.main.DialogShowman;

public abstract class BaseController extends RefWatchingController {

  protected BaseController() {
  }

  protected BaseController(Bundle args) {
    super(args);
  }

  protected ActionBar getActionBar() {
    ActionBarProvider actionBarProvider = ((ActionBarProvider) getActivity());
    return actionBarProvider != null ? actionBarProvider.getSupportActionBar() : null;
  }

  @Override
  protected void onAttach(@NonNull View view) {
    setTitle();
    super.onAttach(view);
  }

  protected void setTitle() {
    Controller parentController = getParentController();
    while (parentController != null) {
      if (parentController instanceof BaseController
          && ((BaseController) parentController).getTitle() != null) {
        return;
      }
      parentController = parentController.getParentController();
    }

    String title = getTitle();
    ActionBar actionBar = getActionBar();
    if (title != null && actionBar != null) {
      actionBar.setTitle(title);
    }
  }

  protected String getTitle() {
    return null;
  }

  protected DialogShowman getDialogShowman() {
    return (DialogShowman) getActivity();
  }
}
