package com.kaciula.archiman.presentation.screen.home;

import android.support.annotation.NonNull;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ViewFlipper;
import butterknife.BindView;
import butterknife.OnClick;
import com.kaciula.archiman.R;
import com.kaciula.archiman.infrastructure.ArchimanApplication;
import com.kaciula.archiman.presentation.util.BaseController;
import com.kaciula.archiman.presentation.util.Toasts;
import com.kaciula.archiman.presentation.widget.DividerItemDecoration;
import java.util.ArrayList;
import javax.inject.Inject;

public class HomeController extends BaseController implements HomeContract.View {

  private static final int CHILD_CONTENT = 0;
  private static final int CHILD_PROGRESS = 1;
  private static final int CHILD_ERROR = 2;

  @Inject HomeContract.Presenter presenter;
  private HomeComponent component;

  @BindView(R.id.flipper) ViewFlipper flipper;
  @BindView(R.id.recycler_view) RecyclerView recyclerView;

  private UserAdapter adapter;

  public HomeController() {
    component = DaggerHomeComponent.builder()
        .appComponent(ArchimanApplication.component())
        .homeModule(new HomeModule(this))
        .build();
    component.inject(this);
  }

  public HomeComponent component() {
    return component;
  }

  @Override
  protected View inflateView(@NonNull LayoutInflater inflater, @NonNull ViewGroup container) {
    return inflater.inflate(R.layout.controller_home, container, false);
  }

  @Override
  protected void onViewBound(@NonNull View view) {
    presenter.setup();
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
  public void showUserMessage(UserViewModel user) {
    Toasts.show("Before orientation change, last user clicked was " + user.toString());
  }

  @Override
  public void render(HomeViewModel viewModel) {
    if (viewModel instanceof HomeViewModel.Initial) {
      renderInitial();
    } else if (viewModel instanceof HomeViewModel.Progress) {
      renderProgress();
    } else if (viewModel instanceof HomeViewModel.Content) {
      HomeViewModel.Content content = (HomeViewModel.Content) viewModel;
      renderContent(content);
    } else if (viewModel instanceof HomeViewModel.Error) {
      renderError();
    } else if (viewModel instanceof HomeViewModel.ContentWithDialog) {
      HomeViewModel.ContentWithDialog contentWithDialog =
          (HomeViewModel.ContentWithDialog) viewModel;
      renderUserDialog(contentWithDialog.user());
    }
  }

  private void renderInitial() {
    recyclerView.addItemDecoration(new DividerItemDecoration(getActivity()));
    recyclerView.setLayoutManager(
        new LinearLayoutManager(getActivity(), LinearLayoutManager.VERTICAL, false));
    adapter = new UserAdapter(getActivity(), new ArrayList<>(), presenter);
    recyclerView.setAdapter(adapter);
  }

  private void renderProgress() {
    flipper.setDisplayedChild(CHILD_PROGRESS);
  }

  private void renderContent(HomeViewModel.Content viewModel) {
    adapter.setItems(viewModel.users());
    flipper.setDisplayedChild(CHILD_CONTENT);
  }

  private void renderError() {
    flipper.setDisplayedChild(CHILD_ERROR);
  }

  private void renderUserDialog(UserViewModel user) {
    getDialogShowman().show(UserDialogFragment.newInstance(user));
  }

  @OnClick(R.id.btn_retry)
  void onClickRetry() {
    presenter.onClickRetry();
  }
}
