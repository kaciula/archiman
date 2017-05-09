package com.kaciula.archiman.presentation.screen.home;

import com.jakewharton.rxrelay2.PublishRelay;
import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.usecase.GetUsers;
import com.kaciula.archiman.presentation.screen.home.event.ClickOkUserDialogEvent;
import com.kaciula.archiman.presentation.screen.home.event.ClickOkUserDialogResult;
import com.kaciula.archiman.presentation.screen.home.event.ClickUserEvent;
import com.kaciula.archiman.presentation.screen.home.event.ClickUserResult;
import com.kaciula.archiman.presentation.screen.home.event.GetUsersEvent;
import com.kaciula.archiman.presentation.screen.home.event.HomeViewEvent;
import com.kaciula.archiman.presentation.util.Toasts;
import com.kaciula.archiman.util.GenericResult;
import com.kaciula.archiman.util.scheduler.BaseSchedulerProvider;
import io.reactivex.Observable;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.exceptions.OnErrorNotImplementedException;
import io.reactivex.observers.DisposableObserver;
import java.util.ArrayList;
import java.util.List;

class HomePresenter implements HomeContract.Presenter {

  private final HomeContract.View view;
  private final BaseSchedulerProvider schedulerProvider;
  private final GetUsers getUsers;

  private final CompositeDisposable disposables;
  private PublishRelay<HomeViewEvent> flowRelay;

  HomePresenter(HomeContract.View view, BaseSchedulerProvider schedulerProvider,
      GetUsers getUsers) {
    this.view = view;
    this.schedulerProvider = schedulerProvider;
    this.getUsers = getUsers;
    disposables = new CompositeDisposable();
    flowRelay = PublishRelay.create();
  }

  @Override
  public void setup() {
    setupFlow();
  }

  @Override
  public void start() {
    flowRelay.accept(GetUsersEvent.create());
  }

  @Override
  public void stop() {
    disposables.clear();
  }

  @Override
  public void onClickRetry() {
    flowRelay.accept(GetUsersEvent.create());
  }

  @Override
  public void onClickUser(UserViewModel user) {
    flowRelay.accept(ClickUserEvent.create(user));
  }

  @Override
  public void onClickOkUserDialog(UserViewModel user) {
    flowRelay.accept(ClickOkUserDialogEvent.create());
  }

  private void setupFlow() {
    Observable<GenericResult> results = flowRelay
        .publish(shared -> Observable.merge(
            shared.ofType(GetUsersEvent.class)
                .flatMap(ignored -> getUsers.execute(GetUsers.RequestModel.create())),
            shared.ofType(ClickUserEvent.class)
                .flatMap(clickUserEvent -> Observable
                    .just(ClickUserResult.create(clickUserEvent.user()))),
            shared.ofType(ClickOkUserDialogEvent.class)
                .flatMap(
                    clickOkUserDialogEvent -> Observable.just(ClickOkUserDialogResult.create())))
        );

    Observable<HomeViewModel> viewModels = results
        .scan(HomeViewModel.initial(), (viewModel, result) -> {
          if (result instanceof GetUsers.ResponseModel) {
            GetUsers.ResponseModel responseModel = (GetUsers.ResponseModel) result;
            if (responseModel.inFlight()) {
              return HomeViewModel.progress();
            } else if (responseModel.isError()) {
              return HomeViewModel.error();
            } else {
              List<UserViewModel> users = new ArrayList<>(responseModel.users().size());
              for (User user : responseModel.users()) {
                users.add(UserViewModel.create(user.name()));
              }
              return HomeViewModel.content(users);
            }
          } else if (result instanceof ClickUserResult) {
            ClickUserResult result1 = ((ClickUserResult) result);
            return viewModel.toBuilder().showUserDialog(true).dialogUser(result1.user()).build();
          } else if (result instanceof ClickOkUserDialogResult) {
            Toasts.show("Clicked OK on user dialog for user " + viewModel.dialogUser());
            return viewModel.toBuilder().showUserDialog(false).dialogUser(null).build();
          }
          throw new IllegalArgumentException(
              "No view model representation for this kind of result");
        });

    disposables.add(viewModels
        .observeOn(schedulerProvider.ui())
        .subscribeWith(new FlowSubscriber()));
  }

  private final class FlowSubscriber extends DisposableObserver<HomeViewModel> {

    @Override
    public void onNext(HomeViewModel viewModel) {
      view.render(viewModel);
    }

    @Override
    public void onError(Throwable throwable) {
      throw new OnErrorNotImplementedException(throwable);
    }

    @Override
    public void onComplete() {
      // Do nothing
    }
  }
}
