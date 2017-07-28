package com.kaciula.archiman.infrastructure.log

import android.content.Context
import android.content.DialogInterface
import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.support.v4.content.FileProvider
import android.support.v7.app.AlertDialog
import android.widget.ListView
import android.widget.Toast
import com.kaciula.archiman.BuildConfig
import com.kaciula.archiman.presentation.util.Intents
import java.io.File

class LogDialog(context: Context) : AlertDialog(context) {

    private val adapter: LogAdapter = LogAdapter()
    private val handler = Handler(Looper.getMainLooper())

    init {
        val listView = ListView(context)
        listView.transcriptMode = ListView.TRANSCRIPT_MODE_NORMAL
        listView.adapter = adapter

        setTitle("Logs")
        setView(listView)
        setButton(DialogInterface.BUTTON_NEGATIVE, "Close") { _, _ ->
            /* no-op */
        }
        setButton(DialogInterface.BUTTON_POSITIVE, "Share") { _, _ -> share() }
    }

    override fun onStart() {
        super.onStart()

        val lumberYard = LumberYard.getInstance(context)

        adapter.setLogs(lumberYard.bufferedLogs())

        lumberYard.setOnLogListener(LogListener())
    }

    private inner class LogListener : LumberYard.OnLogListener {
        override fun onLog(logEntry: LogEntry) {
            addLogEntry(logEntry)
        }

        private fun addLogEntry(logEntry: LogEntry) {
            handler.post { adapter.addLog(logEntry) }
        }
    }

    override fun onStop() {
        super.onStop()

        LumberYard.getInstance(context).setOnLogListener(null)
    }

    private fun share() {
        LumberYard.getInstance(context)
                .save(object : LumberYard.OnSaveLogListener {
                    override fun onSave(file: File) {
                        val sendIntent = Intent(Intent.ACTION_SEND)
                        sendIntent.type = "text/plain"
                        sendIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                        sendIntent.putExtra(Intent.EXTRA_STREAM, FileProvider.getUriForFile(context,
                                BuildConfig.FILE_PROVIDER_AUTHORITY, file))
                        Intents.maybeStartActivity(context, sendIntent)
                    }

                    override fun onError(message: String) {
                        Toast.makeText(context, message, Toast.LENGTH_LONG).show()
                    }
                })
    }
}