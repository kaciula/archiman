package com.kaciula.archiman.presentation.screen.main;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.auto.value.AutoValue;
import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.usecase.GetUsers;
import com.kaciula.archiman.presentation.util.Toasts;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.functions.Function;
import io.reactivex.observers.DisposableObserver;
import java.util.ArrayList;
import java.util.List;
import timber.log.Timber;

class MainPresenter implements MainContract.Presenter {

  private final MainContract.Container container;
  private final MainContract.View view;
  private final BaseSchedulerProvider schedulerProvider;
  private final GetUsers getUsers;

  private final CompositeDisposable disposables;
  private UserViewModel lastClickedUser;

  MainPresenter(MainContract.Container container, MainContract.View view,
      BaseSchedulerProvider schedulerProvider, GetUsers getUsers) {
    this.container = container;
    this.view = view;
    this.schedulerProvider = schedulerProvider;
    this.getUsers = getUsers;
    disposables = new CompositeDisposable();
    this.view.setPresenter(this);
  }

  @Override
  public void start() {
    Timber.d("start");
    view.setup();
    // Do stuff if we have retained state
    if (lastClickedUser != null) {
      container.showUserMessage(lastClickedUser);
    }
    refresh();
  }

  @Override
  public void stop() {
    Timber.d("stop");
    disposables.dispose();
  }

  @Override
  public Object getRetainedState() {
    return State.create(lastClickedUser);
  }

  @Override
  public void setRetainedState(@NonNull Object object) {
    State state = (State) object;
    lastClickedUser = state.lastClickedUser();
  }

  @Override
  public void onClickRetry() {
    refresh();
  }

  @Override
  public void onClickUser(UserViewModel user) {
    container.showUserDialog(user);
    lastClickedUser = user;
  }

  @Override
  public void onClickOkUserDialog(UserViewModel user) {
    Toasts.show("Clicked OK on user dialog for user " + user.name());
  }

  private void refresh() {
    Timber.d("Start refresh");
    view.showProgress();

    disposables.add(getUsers.execute(GetUsers.RequestModel.create())
        .map(new Function<GetUsers.ResponseModel, MainViewModel>() {
          @Override
          public MainViewModel apply(GetUsers.ResponseModel responseValue) throws Exception {
            List<UserViewModel> users = new ArrayList<>(responseValue.users().size());
            for (User user : responseValue.users()) {
              users.add(UserViewModel.create(user.name()));
            }
            return MainViewModel.create(users);
          }
        })
        .subscribeOn(schedulerProvider.io())
        .observeOn(schedulerProvider.ui())
        .subscribeWith(new RefreshSubscriber()));
  }

  private final class RefreshSubscriber extends DisposableObserver<MainViewModel> {

    @Override
    public void onNext(MainViewModel mainViewModel) {
      Timber.d("Received next data");
      view.updateContent(mainViewModel);
      view.showContent();
    }

    @Override
    public void onError(Throwable throwable) {
      Timber.d(throwable, "Received error");
      view.showError();
    }

    @Override
    public void onComplete() {
      // Do nothing
    }
  }


  @AutoValue
  abstract static class State {
    @Nullable
    public abstract UserViewModel lastClickedUser();

    public static State create(@Nullable UserViewModel lastClickedUser) {
      return new AutoValue_MainPresenter_State(lastClickedUser);
    }
  }
}
