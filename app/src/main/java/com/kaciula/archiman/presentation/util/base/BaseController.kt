package com.kaciula.archiman.presentation.util.base

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.kaciula.archiman.presentation.util.conductor.KotlinController
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
}
