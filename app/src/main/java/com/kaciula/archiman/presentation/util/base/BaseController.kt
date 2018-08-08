package com.kaciula.archiman.presentation.util.base

import android.arch.lifecycle.Lifecycle
import android.arch.lifecycle.LifecycleObserver
import android.arch.lifecycle.OnLifecycleEvent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.kaciula.archiman.presentation.util.conductor.KotlinController
import io.reactivex.Observable
import org.koin.standalone.KoinComponent
import timber.log.Timber

abstract class BaseController(args: Bundle = Bundle()) : KotlinController(args), KoinComponent {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup): View {
        Timber.i("CREATE VIEW -> ${javaClass.simpleName}")
        return super.onCreateView(inflater, container)
    }

    override fun onAttach(view: View) {
        super.onAttach(view)
        Timber.i("ATTACH CONTROLLER -> ${javaClass.simpleName}")
    }

    override fun onDetach(view: View) {
        Timber.i("DETACH CONTROLLER -> ${javaClass.simpleName}")
        super.onDetach(view)
    }

    override fun onViewDestroyed() {
        Timber.i("DESTROY VIEW -> ${javaClass.simpleName}")
    }

    override fun onDestroy() {
        Timber.i("DESTROY CONTROLLER -> ${javaClass.simpleName}")
        super.onDestroy()
    }

    protected fun lifecycleObservable(): Observable<Lifecycle.State> {
        return Observable.create { emitter ->
            val observer = object : LifecycleObserver {
                @OnLifecycleEvent(value = Lifecycle.Event.ON_CREATE)
                fun onCreate() {
                    Timber.d("on create controller!")
                    emitter.onNext(Lifecycle.State.CREATED)
                }

                @OnLifecycleEvent(value = Lifecycle.Event.ON_START)
                fun onCreateView() {
                    Timber.d("on create view!")
                    emitter.onNext(Lifecycle.State.STARTED)
                }

                @OnLifecycleEvent(value = Lifecycle.Event.ON_RESUME)
                fun onAttach() {
                    Timber.d("on attach controller!")
                    emitter.onNext(Lifecycle.State.RESUMED)
                }

                @OnLifecycleEvent(value = Lifecycle.Event.ON_PAUSE)
                fun onPause() {
                    Timber.d("on detach controller!")
                    emitter.onNext(Lifecycle.State.STARTED)
                }

                @OnLifecycleEvent(value = Lifecycle.Event.ON_STOP)
                fun onResume() {
                    Timber.d("on destroy view!")
                    emitter.onNext(Lifecycle.State.CREATED)
                }

                @OnLifecycleEvent(value = Lifecycle.Event.ON_DESTROY)
                fun onDestroy() {
                    Timber.d("on destroy!")
                    emitter.onNext(Lifecycle.State.DESTROYED)
                    lifecycle.removeObserver(this)
                }
            }

            lifecycle.addObserver(observer)
        }
    }
}
