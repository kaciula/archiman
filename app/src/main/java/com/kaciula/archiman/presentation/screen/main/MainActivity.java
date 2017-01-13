package com.kaciula.archiman.presentation.screen.main;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.ViewGroup;
import butterknife.BindView;
import butterknife.ButterKnife;
import com.bluelinelabs.conductor.Conductor;
import com.bluelinelabs.conductor.Router;
import com.bluelinelabs.conductor.RouterTransaction;
import com.kaciula.archiman.R;
import com.kaciula.archiman.presentation.screen.home.HomeController;
import com.kaciula.archiman.presentation.screen.home.UserViewModel;
import com.kaciula.archiman.presentation.util.ArchimanActivity;
import com.kaciula.archiman.presentation.util.DevDrawer;
import com.kaciula.archiman.presentation.util.Toasts;
import timber.log.Timber;

public class MainActivity extends ArchimanActivity implements ActionBarProvider, Container {

  @BindView(R.id.toolbar) Toolbar toolbar;
  @BindView(R.id.controller_container) ViewGroup container;

  private Router router;
  private DevDrawer devDrawer;

  public static Intent getStartIntent(Context context) {
    return new Intent(context, MainActivity.class);
  }

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    ButterKnife.bind(this);

    setSupportActionBar(toolbar);

    router = Conductor.attachRouter(this, container, savedInstanceState);
    if (!router.hasRootController()) {
      router.setRoot(RouterTransaction.with(new HomeController()));
    }

    setupDevDrawer();
  }

  @Override
  protected void onStart() {
    super.onStart();
    devDrawer.onStart();
  }

  @Override
  protected void onResume() {
    super.onResume();
    devDrawer.onResume();
    Timber.i("Resuming ...");
  }

  @Override
  public void onBackPressed() {
    if (!router.handleBack()) {
      super.onBackPressed();
    }
  }

  @Override
  protected void onPause() {
    super.onPause();
    devDrawer.onPause();
  }

  @Override
  protected void onStop() {
    super.onStop();
    devDrawer.onStop();
  }

  @Override
  public void showUserDialog(UserViewModel user) {
    if (canShowDialogs()) {
      UserDialogFragment.newInstance(user).show(getSupportFragmentManager(), "UserDialogFragment");
    }
  }

  @Override
  public void showUserMessage(UserViewModel user) {
    Toasts.show("Before orientation change, last user clicked was " + user.toString());
  }

  private void setupDevDrawer() {
    devDrawer = new DevDrawer(this);
  }
}
