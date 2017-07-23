package com.kaciula.archiman.presentation.screen.userdetails;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import butterknife.BindView;
import com.kaciula.archiman.R;
import com.kaciula.archiman.infrastructure.ArchimanApplication;
import com.kaciula.archiman.presentation.screen.home.UserViewModel;
import com.kaciula.archiman.presentation.util.BaseController;
import com.kaciula.archiman.presentation.util.BundleBuilder;
import javax.inject.Inject;

public class UserDetailsController extends BaseController implements UserDetailsContract.View {

  private static final String KEY_USER = "key.user";

  @Inject UserDetailsContract.Presenter presenter;
  private UserDetailsComponent component;

  @BindView(R.id.tv_user_name) TextView tvUserName;

  @SuppressWarnings("WeakerAccess")
  public UserDetailsController(Bundle args) {
    super(args);

    UserViewModel user = getArgs().getParcelable(KEY_USER);

    component = DaggerUserDetailsComponent.builder()
        .appComponent(ArchimanApplication.component())
        .userDetailsModule(new UserDetailsModule(this, user))
        .build();
    component.inject(this);
  }

  public UserDetailsController(UserViewModel user) {
    this(new BundleBuilder(new Bundle())
        .putParcelable(KEY_USER, user)
        .build());
  }

  public UserDetailsComponent component() {
    return component;
  }

  @Override
  protected View inflateView(@NonNull LayoutInflater inflater, @NonNull ViewGroup container) {
    return inflater.inflate(R.layout.controller_user_details, container, false);
  }

  @Override
  protected void onViewBound(@NonNull View view) {
    presenter.init();
  }

  @Override
  protected void onAttach(@NonNull View view) {
    super.onAttach(view);
    presenter.start();
  }

  @Override
  protected void onDetach(@NonNull View view) {
    presenter.stop();
    super.onDetach(view);
  }

  @Override
  protected void onDestroy() {
    presenter.destroy();
    super.onDestroy();
  }

  @Override
  public void render(UserDetailsViewModel viewModel) {
    tvUserName.setText(viewModel.userName());
  }
}
