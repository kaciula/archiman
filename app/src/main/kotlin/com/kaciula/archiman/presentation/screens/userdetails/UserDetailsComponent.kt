package com.kaciula.archiman.presentation.screens.userdetails

import com.kaciula.archiman.injection.ActivityScope
import com.kaciula.archiman.injection.AppComponent
import dagger.Component

@ActivityScope
@Component(dependencies = arrayOf(AppComponent::class), modules = arrayOf(UserDetailsModule::class))
interface UserDetailsComponent {

    fun inject(userDetailsController: UserDetailsController)
}
