package com.kaciula.archiman.presentation.util.base

import android.arch.lifecycle.Lifecycle
import android.arch.lifecycle.LifecycleObserver
import android.arch.lifecycle.OnLifecycleEvent
import android.os.Bundle
import android.view.View
import com.bluelinelabs.conductor.archlifecycle.LifecycleController
import io.reactivex.Observable
import org.koin.standalone.KoinComponent
import timber.log.Timber

abstract class BaseController(args: Bundle = Bundle()) : LifecycleController(args), KoinComponent {

    override fun onAttach(view: View) {
        super.onAttach(view)
        Timber.i("ATTACH CONTROLLER -> ${javaClass.simpleName}")
    }

    override fun onDetach(view: View) {
        Timber.i("DETACH CONTROLLER -> ${javaClass.simpleName}")
        super.onDetach(view)
    }

    override fun onDestroyView(view: View) {
        Timber.i("DESTROY VIEW -> ${javaClass.simpleName}")
        super.onDestroyView(view)
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
