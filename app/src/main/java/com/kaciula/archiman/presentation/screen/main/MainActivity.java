package com.kaciula.archiman.presentation.screen.main;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v7.widget.Toolbar;
import android.view.ViewGroup;
import butterknife.BindView;
import butterknife.ButterKnife;
import com.bluelinelabs.conductor.Conductor;
import com.bluelinelabs.conductor.Router;
import com.bluelinelabs.conductor.RouterTransaction;
import com.kaciula.archiman.R;
import com.kaciula.archiman.presentation.screen.home.HomeComponent;
import com.kaciula.archiman.presentation.screen.home.HomeController;
import com.kaciula.archiman.presentation.screen.home.UserViewModel;
import com.kaciula.archiman.presentation.screen.userdetails.UserDetailsController;
import com.kaciula.archiman.presentation.util.ArchimanActivity;
import com.kaciula.archiman.presentation.util.DevDrawer;
import java.util.UUID;
import timber.log.Timber;

public class MainActivity extends ArchimanActivity
    implements ActionBarProvider, ComponentProvider, DialogShowman, Navigator {

  private static final String TAG_CONTROLLER_HOME = "HomeController";
  private static final String TAG_CONTROLLER_USER_DETAILS = "UserDetailsController";

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
      router.setRoot(RouterTransaction.with(new HomeController()).tag(TAG_CONTROLLER_HOME));
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
  public HomeComponent getHomeComponent() {
    HomeController homeController =
        (HomeController) router.getControllerWithTag(TAG_CONTROLLER_HOME);
    return homeController.component();
  }

  @Override
  public void show(DialogFragment dialogFragment) {
    if (canShowDialogs()) {
      dialogFragment.show(getSupportFragmentManager(), UUID.randomUUID().toString());
    }
  }

  private void setupDevDrawer() {
    devDrawer = new DevDrawer(this);
  }

  @Override
  public void goToUserDetailsScreen(UserViewModel user) {
    router.pushController(
        RouterTransaction.with(new UserDetailsController(user)).tag(TAG_CONTROLLER_USER_DETAILS));
  }
}
