package com.kaciula.archiman.presentation.util.conductor

import android.app.Dialog
import android.os.Bundle
import android.view.View
import org.koin.standalone.KoinComponent
import timber.log.Timber

abstract class BaseDialogController(args: Bundle = Bundle()) : KotlinDialogController(args),
    KoinComponent {

    override fun onCreateDialog(savedViewState: Bundle?): Dialog {
        Timber.i("CREATE VIEW -> ${javaClass.simpleName}")
        return super.onCreateDialog(savedViewState)
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
