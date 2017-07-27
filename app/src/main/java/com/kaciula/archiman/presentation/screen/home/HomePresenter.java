package com.kaciula.archiman.presentation.screen.home;

import com.jakewharton.rxrelay2.PublishRelay;
import com.kaciula.archiman.domain.entity.User;
import com.kaciula.archiman.domain.usecases.GetUsers;
import com.kaciula.archiman.domain.util.GenericResult;
import com.kaciula.archiman.domain.util.SchedulerProvider;
import com.kaciula.archiman.presentation.screen.home.event.CancelUserDialogEvent;
import com.kaciula.archiman.presentation.screen.home.event.CancelUserDialogResult;
import com.kaciula.archiman.presentation.screen.home.event.ClickOkUserDialogEvent;
import com.kaciula.archiman.presentation.screen.home.event.ClickOkUserDialogResult;
import com.kaciula.archiman.presentation.screen.home.event.ClickUserEvent;
import com.kaciula.archiman.presentation.screen.home.event.ClickUserResult;
import com.kaciula.archiman.presentation.screen.home.event.GetUsersEvent;
import com.kaciula.archiman.presentation.screen.home.event.HomeViewEvent;
import com.kaciula.archiman.presentation.screen.home.event.RecreateEvent;
import com.kaciula.archiman.presentation.screen.home.event.RecreateResult;
import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.ObservableTransformer;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.exceptions.OnErrorNotImplementedException;
import io.reactivex.observers.DisposableObserver;
import java.util.ArrayList;
import java.util.List;
import timber.log.Timber;

class HomePresenter implements HomeContract.Presenter {

  private final HomeContract.View view;
  private final SchedulerProvider schedulerProvider;
  private final GetUsers getUsers;

  private final CompositeDisposable disposables;
  private boolean isFirstInit;
  private final PublishRelay<HomeViewEvent> flowRelay;

  HomePresenter(HomeContract.View view, SchedulerProvider schedulerProvider,
      GetUsers getUsers) {
    this.view = view;
    this.schedulerProvider = schedulerProvider;
    this.getUsers = getUsers;
    disposables = new CompositeDisposable();
    isFirstInit = true;
    flowRelay = PublishRelay.create();
  }

  @Override
  public void init() {
    Timber.d("presenter init");
    if (isFirstInit) {
      isFirstInit = false;
      HomeViewModel initialViewModel = HomeViewModel.justInitialize();
      setupFlow(initialViewModel);

      flowRelay.accept(GetUsersEvent.create());
    } else {
      flowRelay.accept(RecreateEvent.create());
    }
  }

  @Override
  public void start() {
    Timber.d("presenter start");
  }

  @Override
  public void stop() {
    Timber.d("presenter stop");
  }

  @Override
  public void destroy() {
    Timber.d("presenter destroy");
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

  @Override
  public void onCancelUserDialog() {
    flowRelay.accept(CancelUserDialogEvent.create());
  }

  @Override
  public void onClickUserDetails(UserViewModel user) {
    view.goToUserDetailsScreen(user);
  }

  private void setupFlow(HomeViewModel initialViewModel) {
    disposables.add(flowRelay
        .compose(new EventsMerger(getUsers))
        .compose(new StateReducer(initialViewModel))
        .observeOn(schedulerProvider.ui())
        .subscribeWith(new FlowSubscriber()));
  }


  private static class EventsMerger implements ObservableTransformer<HomeViewEvent, GenericResult> {

    private final GetUsers getUsers;

    EventsMerger(GetUsers getUsers) {
      this.getUsers = getUsers;
    }

    @Override
    public ObservableSource<GenericResult> apply(Observable<HomeViewEvent> upstream) {
      return upstream.publish(shared -> Observable.merge(
          shared.ofType(GetUsersEvent.class)
              .flatMap(ignored -> getUsers.execute(new GetUsers.RequestModel())),
          Observable.merge(
              shared.ofType(ClickUserEvent.class)
                  .flatMap(clickUserEvent -> Observable
                      .just(new ClickUserResult(clickUserEvent.user()))),
              shared.ofType(ClickOkUserDialogEvent.class)
                  .flatMap(
                      clickOkUserDialogEvent -> Observable.just(new ClickOkUserDialogResult())),
              shared.ofType(CancelUserDialogEvent.class)
                  .flatMap(
                      cancelUserDialogEvent -> Observable.just(new CancelUserDialogResult())),
              shared.ofType(RecreateEvent.class)
                  .flatMap(
                      recreateEvent -> Observable.just(new RecreateResult()))))
      );
    }
  }


  private static class StateReducer implements ObservableTransformer<GenericResult, HomeViewModel> {

    private HomeViewModel initialViewModel;

    StateReducer(HomeViewModel initialViewModel) {
      this.initialViewModel = initialViewModel;
    }

    @Override
    public ObservableSource<HomeViewModel> apply(Observable<GenericResult> upstream) {
      return upstream.scan(initialViewModel, (viewModel, result) -> {
        if (result instanceof GetUsers.ResponseModel) {
          GetUsers.ResponseModel responseModel = (GetUsers.ResponseModel) result;
          if (responseModel.isInFlight()) {
            return HomeViewModel.progress();
          } else if (responseModel.isError()) {
            return HomeViewModel.error();
          } else {
            List<UserViewModel> users = new ArrayList<>(responseModel.getUsers().size());
            for (User user : responseModel.getUsers()) {
              users.add(UserViewModel.create(user.getName()));
            }
            return HomeViewModel.content(users);
          }
        } else if (result instanceof ClickUserResult) {
          ClickUserResult result1 = ((ClickUserResult) result);
          return viewModel.toBuilder()
              .showUserDialog(true)
              .dialogUser(result1.getUser())
              .isRecreate(false)
              .initialize(false)
              .build();
        } else if (result instanceof ClickOkUserDialogResult) {
          return viewModel.toBuilder()
              .showUserDialog(false)
              .dialogUser(null)
              .isRecreate(false)
              .initialize(false)
              .build();
        } else if (result instanceof CancelUserDialogResult) {
          return viewModel.toBuilder()
              .showUserDialog(false)
              .dialogUser(null)
              .isRecreate(false)
              .initialize(false)
              .build();
        } else if (result instanceof RecreateResult) {
          return viewModel.toBuilder()
              .isRecreate(true)
              .initialize(true)
              .build();
        }
        throw new IllegalArgumentException(
            "No view model representation for this kind of result");
      });
    }
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
