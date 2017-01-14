package com.kaciula.archiman.presentation.screen.home;

import com.kaciula.archiman.util.injection.ActivityScope;
import com.kaciula.archiman.util.injection.AppComponent;
import dagger.Component;

@ActivityScope
@Component(dependencies = AppComponent.class, modules = HomeModule.class)
public interface HomeComponent {

  void inject(HomeController homeController);

  void inject(UserDialogFragment userDialogFragment);
}
