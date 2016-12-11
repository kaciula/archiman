package com.kaciula.archiman.presentation.screen.main;

import com.kaciula.archiman.util.injection.ActivityScope;
import com.kaciula.archiman.util.injection.AppComponent;
import dagger.Component;

@ActivityScope
@Component(dependencies = AppComponent.class, modules = MainModule.class)
public interface MainComponent {

  void inject(MainActivity activity);

  void inject(MainView view);

  void inject(UserDialogFragment dialogFragment);
}
