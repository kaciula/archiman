package com.kaciula.archiman.presentation.util

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.MenuItem
import timber.log.Timber

abstract class BaseActivity : AppCompatActivity() {

    private var wasCalledSaveInstanceState = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Timber.i("CREATE SCREEN -> ${javaClass.simpleName}")
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        wasCalledSaveInstanceState = true
    }

    override fun onResume() {
        super.onResume()
        Timber.i("RESUME SCREEN -> ${javaClass.simpleName}")
        wasCalledSaveInstanceState = false
    }

    override fun onPause() {
        super.onPause()
        Timber.i("PAUSE SCREEN -> ${javaClass.simpleName}")
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        val id = item.itemId
        if (id == android.R.id.home) {
            finish()
            return true
        }
        return super.onOptionsItemSelected(item)
    }

    override fun onDestroy() {
        Timber.i("DESTROY SCREEN -> ${javaClass.simpleName}")
        super.onDestroy()
    }

    fun canShowDialogs(): Boolean = !wasCalledSaveInstanceState
}
