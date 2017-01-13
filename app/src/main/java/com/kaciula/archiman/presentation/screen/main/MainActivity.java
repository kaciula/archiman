package com.kaciula.archiman.presentation.screen.main;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import butterknife.BindView;
import butterknife.ButterKnife;
import com.kaciula.archiman.R;
import com.kaciula.archiman.infrastructure.ArchimanApplication;
import com.kaciula.archiman.presentation.util.ArchimanActivity;
import com.kaciula.archiman.presentation.util.DevDrawer;
import com.kaciula.archiman.presentation.util.Toasts;
import javax.inject.Inject;
import timber.log.Timber;

public class MainActivity extends ArchimanActivity implements MainContract.Container {

  @Inject MainContract.Presenter presenter;

  @BindView(R.id.view_main) MainView mainView;

  private MainComponent component;

  private DevDrawer devDrawer;

  public static Intent getStartIntent(Context context) {
    return new Intent(context, MainActivity.class);
  }

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    ButterKnife.bind(this);

    setupComponent();
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
  protected void onPause() {
    super.onPause();
    devDrawer.onPause();
  }

  @Override
  protected void onStop() {
    super.onStop();
    devDrawer.onStop();
  }

  private void setupComponent() {
    component = DaggerMainComponent.builder().appComponent(ArchimanApplication.component())
        .mainModule(new MainModule(this, mainView)).build();
    component.inject(this);
    if (getLastCustomNonConfigurationInstance() != null) {
      presenter.setRetainedState(getLastCustomNonConfigurationInstance());
    }
  }

  public MainComponent component() {
    return component;
  }

  @Override
  public Object onRetainCustomNonConfigurationInstance() {
    return presenter.getRetainedState();
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
