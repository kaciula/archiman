package com.kaciula.archiman.presentation.screen.main;

import android.os.Bundle;
import butterknife.BindView;
import butterknife.ButterKnife;
import com.kaciula.archiman.R;
import com.kaciula.archiman.domain.model.User;
import com.kaciula.archiman.infrastructure.ArchimanApplication;
import com.kaciula.archiman.presentation.util.ArchimanActivity;
import com.kaciula.archiman.presentation.util.Toasts;
import javax.inject.Inject;

public class MainActivity extends ArchimanActivity implements MainContract.Container {

  @Inject MainContract.Presenter presenter;

  @BindView(R.id.view_main) MainView mainView;

  private MainComponent component;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    ButterKnife.bind(this);

    setupComponent();
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
  public void showUserDialog(User user) {
    if (canShowDialogs()) {
      UserDialogFragment.newInstance(user).show(getSupportFragmentManager(), "UserDialogFragment");
    }
  }

  @Override
  public void showUserMessage(User user) {
    Toasts.show("Before orientation change, last user clicked was " + user.toString());
  }
}
