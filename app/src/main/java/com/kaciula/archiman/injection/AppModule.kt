package com.kaciula.archiman.injection

import android.content.Context
import com.kaciula.archiman.domain.util.SchedulerProvider
import com.kaciula.archiman.infrastructure.util.AndroidSchedulerProvider
import com.kaciula.archiman.presentation.screens.main.Coordinator
import com.kaciula.archiman.presentation.screens.main.CoordinatorImpl
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module
class AppModule(val context: Context) {

    @Provides
    @Singleton
    fun provideContext(): Context {
        return context
    }

    /*@Provides
    @Singleton
    fun provideApplication(): Context {
        return context as ArchimanApplication
    }*/

    @Provides
    @Singleton
    fun provideSchedulerProvider(): SchedulerProvider {
        return AndroidSchedulerProvider()
    }

    @Provides
    @Singleton
    fun provideCoordinator(context: Context): Coordinator {
        return CoordinatorImpl(context)
    }
}
