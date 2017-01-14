package com.kaciula.archiman.presentation.screen.home;

import static com.kaciula.archiman.infrastructure.BaseApplication.getContext;

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

  @BindView(R.id.flipper) ViewFlipper flipper;
  @BindView(R.id.recycler_view) RecyclerView recyclerView;

  @Inject
  HomeContract.Presenter presenter;

  private UserAdapter adapter;

  @NonNull
  @Override
  protected View onCreateView(@NonNull LayoutInflater inflater, @NonNull ViewGroup container) {
    setupAndInjectIfNecessary();
    return super.onCreateView(inflater, container);
  }

  private void setupAndInjectIfNecessary() {
    if (presenter == null) {
      HomeComponent component = DaggerHomeComponent.builder()
          .appComponent(ArchimanApplication.component())
          .homeModule(new HomeModule(this))
          .build();
      component.inject(this);
    }
    presenter.setContainer(getContainer());
  }

  @Override
  protected View inflateView(@NonNull LayoutInflater inflater, @NonNull ViewGroup container) {
    return inflater.inflate(R.layout.controller_home, container, false);
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
    recyclerView.addItemDecoration(new DividerItemDecoration(getContext()));
    recyclerView.setLayoutManager(
        new LinearLayoutManager(getContext(), LinearLayoutManager.VERTICAL, false));
    adapter = new UserAdapter(getContext(), new ArrayList<UserViewModel>(), presenter);
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

  @OnClick(R.id.btn_retry)
  void onClickRetry() {
    presenter.onClickRetry();
  }
}
