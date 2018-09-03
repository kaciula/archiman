package com.kaciula.archiman.presentation.screens.main

import android.os.Bundle
import com.kaciula.archiman.presentation.screens.main.domain.MainModel

object BundlePacker {

    fun addModelToBundle(model: MainModel, outState: Bundle) {
        outState.putBundle(MODEL_RESTORE_KEY, modelToBundle(model))
    }

    private fun modelToBundle(model: MainModel): Bundle {
        return Bundle().apply {
            putBoolean("isColdStart", model.isColdStart)
        }
    }

    fun resolveDefaultModel(savedInstanceState: Bundle?): MainModel {
        if (savedInstanceState != null && savedInstanceState.containsKey(MODEL_RESTORE_KEY)) {
            return bundleToModel(savedInstanceState.getBundle(MODEL_RESTORE_KEY))
        }
        return MainModel(isColdStart = true)
    }

    private fun bundleToModel(bundle: Bundle): MainModel {
        return MainModel(isColdStart = bundle.getBoolean("isColdStart", false))
    }
}

private const val MODEL_RESTORE_KEY = "key.model"