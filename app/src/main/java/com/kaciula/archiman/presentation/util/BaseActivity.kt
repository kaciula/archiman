package com.kaciula.archiman.presentation.util

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.MenuItem
import timber.log.Timber

abstract class BaseActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val reinitialized = if (savedInstanceState != null) "re-initialized" else ""
        Timber.i("CREATE SCREEN -> ${javaClass.simpleName} $reinitialized")
    }

    override fun onStart() {
        super.onStart()
        Timber.i("START SCREEN -> ${javaClass.simpleName}")
    }

    override fun onResume() {
        super.onResume()
        Timber.i("RESUME SCREEN -> ${javaClass.simpleName}")
    }

    override fun onPause() {
        super.onPause()
        Timber.i("PAUSE SCREEN -> ${javaClass.simpleName}")
    }

    override fun onStop() {
        super.onStop()
        Timber.i("STOP SCREEN -> ${javaClass.simpleName}")
    }

    override fun onDestroy() {
        Timber.i("DESTROY SCREEN -> ${javaClass.simpleName}")
        super.onDestroy()
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        val id = item.itemId
        if (id == android.R.id.home) {
            finish()
            return true
        }
        return super.onOptionsItemSelected(item)
    }
}
