package com.kaciula.archiman.presentation.screen.home

import com.kaciula.archiman.injection.ActivityScope
import com.kaciula.archiman.injection.AppComponent
import dagger.Component

@ActivityScope
@Component(dependencies = arrayOf(AppComponent::class), modules = arrayOf(HomeModule::class))
interface HomeComponent {

    fun inject(homeController: HomeController)

    fun inject(userDialogFragment: UserDialogFragment)
}
