package com.kaciula.archiman.presentation.util

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.view.MenuItem
import com.crashlytics.android.Crashlytics
import com.kaciula.archiman.infrastructure.ArchimanApplication

abstract class ArchimanActivity : AppCompatActivity() {

    private var wasCalledSaveInstanceState = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (ArchimanApplication.get().isCrashlyticsUsed) {
            Crashlytics.setString("current screen", localClassName)
        }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        wasCalledSaveInstanceState = true
    }

    override fun onResume() {
        super.onResume()
        wasCalledSaveInstanceState = false
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        val id = item.itemId
        if (id == android.R.id.home) {
            finish()
            return true
        }
        return super.onOptionsItemSelected(item)
    }

    fun canShowDialogs(): Boolean = !wasCalledSaveInstanceState
}
