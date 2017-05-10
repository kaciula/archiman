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
  protected void onDestroy() {
    presenter.destroy();
    super.onDestroy();
  }

  @Override
  public void render(HomeViewModel viewModel) {
    if (viewModel.isInitial()) {
      recyclerView.addItemDecoration(new DividerItemDecoration(getActivity()));
      recyclerView.setLayoutManager(
          new LinearLayoutManager(getActivity(), LinearLayoutManager.VERTICAL, false));
      adapter = new UserAdapter(getActivity(), new ArrayList<>(), presenter);
      recyclerView.setAdapter(adapter);
    } else if (viewModel.isProgress()) {
      flipper.setDisplayedChild(CHILD_PROGRESS);
    } else if (viewModel.isError()) {
      flipper.setDisplayedChild(CHILD_ERROR);
    } else if (viewModel.showUserDialog()) {
      showContent(viewModel);
      if (!viewModel.isOrientationChange()) {
        getDialogShowman().show(UserDialogFragment.newInstance(viewModel.dialogUser()));
      }
    } else {
      showContent(viewModel);
    }
  }

  private void showContent(HomeViewModel viewModel) {
    adapter.setItems(viewModel.users());
    flipper.setDisplayedChild(CHILD_CONTENT);
  }

  @OnClick(R.id.btn_retry)
  void onClickRetry() {
    presenter.onClickRetry();
  }
}
