package com.kaciula.archiman.presentation.util

import android.os.Handler
import android.os.Looper
import android.widget.Toast
import com.kaciula.archiman.infrastructure.BaseApplication

object Toasts {

    private val MAIN_THREAD = Handler(Looper.getMainLooper())

    fun show(message: String) {
        val ctx = BaseApplication.getContext()
        if (Looper.myLooper() == Looper.getMainLooper()) {
            Toast.makeText(ctx, message, Toast.LENGTH_SHORT).show()
        } else {
            MAIN_THREAD.post { Toast.makeText(ctx, message, Toast.LENGTH_SHORT).show() }
        }
    }

    fun show(messageId: Int, vararg args: Any) {
        val ctx = BaseApplication.getContext()
        if (Looper.myLooper() == Looper.getMainLooper()) {
            Toast.makeText(ctx, ctx.getString(messageId, *args), Toast.LENGTH_SHORT).show()
        } else {
            MAIN_THREAD.post { Toast.makeText(ctx, ctx.getString(messageId, *args), Toast.LENGTH_SHORT).show() }
        }
    }

    fun showLong(message: String) {
        val ctx = BaseApplication.getContext()
        if (Looper.myLooper() == Looper.getMainLooper()) {
            Toast.makeText(ctx, message, Toast.LENGTH_LONG).show()
        } else {
            MAIN_THREAD.post { Toast.makeText(ctx, message, Toast.LENGTH_LONG).show() }
        }
    }

    fun showLong(messageId: Int, vararg args: Any) {
        val ctx = BaseApplication.getContext()
        if (Looper.myLooper() == Looper.getMainLooper()) {
            Toast.makeText(ctx, ctx.getString(messageId, *args), Toast.LENGTH_LONG).show()
        } else {
            MAIN_THREAD.post { Toast.makeText(ctx, ctx.getString(messageId, *args), Toast.LENGTH_LONG).show() }
        }
    }
}
