package com.kaciula.archiman.presentation.screens.home

import com.kaciula.archiman.injection.ActivityScope
import com.kaciula.archiman.injection.AppComponent
import dagger.Component

@ActivityScope
@Component(dependencies = [AppComponent::class], modules = [HomeModule::class])
interface HomeComponent {

    fun inject(homeController: HomeController)

    fun inject(userInfoController: UserInfoController)
}
