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

  @Inject
  HomeContract.Presenter presenter;
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
  public void setup() {
    recyclerView.addItemDecoration(new DividerItemDecoration(getActivity()));
    recyclerView.setLayoutManager(
        new LinearLayoutManager(getActivity(), LinearLayoutManager.VERTICAL, false));
    adapter = new UserAdapter(getActivity(), new ArrayList<>(), presenter);
    recyclerView.setAdapter(adapter);
  }

  @Override
  public void updateContent(HomeViewModel data) {
    adapter.setItems(data.users());
  }

  @Override
  public void showContent() {
    flipper.setDisplayedChild(CHILD_CONTENT);
  }

  @Override
  public void showProgress() {
    flipper.setDisplayedChild(CHILD_PROGRESS);
  }

  @Override
  public void showError() {
    flipper.setDisplayedChild(CHILD_ERROR);
  }

  @Override
  public void showUserDialog(UserViewModel user) {
    getDialogShowman().show(UserDialogFragment.newInstance(user));
  }

  @Override
  public void showUserMessage(UserViewModel user) {
    Toasts.show("Before orientation change, last user clicked was " + user.toString());
  }

  @OnClick(R.id.btn_retry)
  void onClickRetry() {
    presenter.onClickRetry();
  }
}
