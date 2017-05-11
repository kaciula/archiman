package com.kaciula.archiman.presentation.screen.userdetails;

import com.kaciula.archiman.util.injection.ActivityScope;
import com.kaciula.archiman.util.injection.AppComponent;
import dagger.Component;

@ActivityScope
@Component(dependencies = AppComponent.class, modules = UserDetailsModule.class)
public interface UserDetailsComponent {

  void inject(UserDetailsController userDetailsController);
}