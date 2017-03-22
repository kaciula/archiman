package com.kaciula.archiman.presentation.screen.home;

import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.usecase.GetUsers;
import com.kaciula.archiman.presentation.util.Toasts;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.observers.DisposableObserver;
import java.util.ArrayList;
import java.util.List;
import timber.log.Timber;

class HomePresenter implements HomeContract.Presenter {

  private final HomeContract.View view;
  private final BaseSchedulerProvider schedulerProvider;
  private final GetUsers getUsers;

  private final CompositeDisposable disposables;
  private HomeViewModel viewModel;
  private UserViewModel lastClickedUser;

  HomePresenter(HomeContract.View view, BaseSchedulerProvider schedulerProvider,
      GetUsers getUsers) {
    this.view = view;
    this.schedulerProvider = schedulerProvider;
    this.getUsers = getUsers;
    disposables = new CompositeDisposable();
  }

  @Override
  public void setup() {
    view.render(HomeViewModel.Initial.create());
  }

  @Override
  public void start() {
    // Do stuff if we have retained state
    if (lastClickedUser != null) {
      view.showUserMessage(lastClickedUser);
    }
    refresh();
  }

  @Override
  public void stop() {
    disposables.clear();
  }

  @Override
  public void onClickRetry() {
    refresh();
  }

  @Override
  public void onClickUser(UserViewModel user) {
    if (viewModel instanceof HomeViewModel.Content) {
      viewModel =
          HomeViewModel.ContentWithDialog.create(((HomeViewModel.Content) viewModel).users(), user);
    } else if (viewModel instanceof HomeViewModel.ContentWithDialog) {
      viewModel =
          HomeViewModel.ContentWithDialog
              .create(((HomeViewModel.ContentWithDialog) viewModel).users(), user);
    }
    view.render(viewModel);
    lastClickedUser = user;
  }

  @Override
  public void onClickOkUserDialog(UserViewModel user) {
    Toasts.show("Clicked OK on user dialog for user " + user.name());
  }

  private void refresh() {
    Timber.d("Start refresh");
    viewModel = HomeViewModel.Progress.create();
    view.render(viewModel);

    disposables.add(getUsers.execute(GetUsers.RequestModel.create())
        .map(responseModel -> {
          List<UserViewModel> users = new ArrayList<>(responseModel.users().size());
          for (User user : responseModel.users()) {
            users.add(UserViewModel.create(user.name()));
          }
          return HomeViewModel.Content.create(users);
        })
        .doOnNext(homeViewModel -> {
          viewModel = homeViewModel;
        })
        .subscribeOn(schedulerProvider.io())
        .observeOn(schedulerProvider.ui())
        .subscribeWith(new RefreshSubscriber()));
  }

  private final class RefreshSubscriber extends DisposableObserver<HomeViewModel> {

    @Override
    public void onNext(HomeViewModel homeViewModel) {
      Timber.d("Received next data");
      viewModel = homeViewModel;
      view.render(viewModel);
    }

    @Override
    public void onError(Throwable throwable) {
      Timber.d(throwable, "Received error");
      viewModel = HomeViewModel.Error.create();
      view.render(viewModel);
    }

    @Override
    public void onComplete() {
      // Do nothing
    }
  }
}
