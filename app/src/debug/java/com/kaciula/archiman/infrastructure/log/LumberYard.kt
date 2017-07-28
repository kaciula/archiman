package com.kaciula.archiman.infrastructure.log

import android.annotation.SuppressLint
import android.content.Context
import com.kaciula.archiman.R
import timber.log.Timber
import java.io.File
import java.io.FileWriter
import java.io.IOException
import java.text.SimpleDateFormat
import java.util.*

class LumberYard(context: Context) {

    private val filenameDate = SimpleDateFormat("yyyy-MM-dd hhmm a", Locale.US)
    private val logDatePattern = SimpleDateFormat("MM-dd hh:mm:ss.S", Locale.US)

    private val context: Context

    private val entries = ArrayDeque<LogEntry>(BUFFER_SIZE + 1)

    private var onLogListener: OnLogListener? = null

    init {
        if (!HAS_TIMBER) {
            throw RuntimeException("Timber dependency is not found")
        }
        this.context = context.applicationContext
    }

    fun tree(): Timber.Tree {
        return object : Timber.DebugTree() {
            override fun log(priority: Int, tag: String?, message: String, t: Throwable?) {
                addEntry(LogEntry(priority, tag!!, message,
                        logDatePattern.format(Calendar.getInstance().time)))
            }
        }
    }

    fun setOnLogListener(onLogListener: OnLogListener?) {
        this.onLogListener = onLogListener
    }

    @Synchronized private fun addEntry(entry: LogEntry) {
        entries.addLast(entry)

        if (entries.size > BUFFER_SIZE) {
            entries.removeFirst()
        }

        onLog(entry)
    }

    fun bufferedLogs(): List<LogEntry> {
        return ArrayList(entries)
    }

    /**
     * Save the current logs to disk.
     */
    fun save(listener: OnSaveLogListener) {
        val dir = logDir

        if (dir == null) {
            listener.onError(context.getString(R.string.all_save_logs_error))
            return
        }

        var fileWriter: FileWriter? = null

        try {
            val output = File(dir, logFileName)
            fileWriter = FileWriter(output, true)

            val entries = bufferedLogs()
            for (entry in entries) {
                fileWriter.write(entry.prettyPrint() + "\n")
            }

            listener.onSave(output)

        } catch (exception: IOException) {
            listener.onError(exception.message ?: "")
            Timber.w(exception)
        } finally {
            if (fileWriter != null) {
                try {
                    fileWriter.close()
                } catch (exception: IOException) {
                    listener.onError(exception.message ?: "")
                    Timber.w(exception)
                }

            }
        }
    }

    fun cleanUp() {
        val dir = logDir
        if (dir != null) {
            val files = dir.listFiles()
            for (file in files) {
                if (file.name.endsWith(LOG_FILE_END)) {
                    file.delete()
                }
            }
        }
    }

    private val logDir: File?
        get() {
            val file = File(context.filesDir, "logs")
            if (!file.exists()) {
                file.mkdirs()
            }
            return file
        }

    private fun onLog(entry: LogEntry) {
        if (onLogListener != null) {
            onLogListener!!.onLog(entry)
        }
    }

    private val logFileName: String
        get() {
            val pattern = "%s%s"
            val currentDate = filenameDate.format(Calendar.getInstance().time)

            return String.format(pattern, currentDate, LOG_FILE_END)
        }

    interface OnSaveLogListener {
        fun onSave(file: File)

        fun onError(message: String)
    }


    interface OnLogListener {
        fun onLog(logEntry: LogEntry)
    }

    companion object {

        private val HAS_TIMBER: Boolean

        init {
            var hasDependency: Boolean

            try {
                Class.forName("timber.log.Timber")
                hasDependency = true
            } catch (exception: ClassNotFoundException) {
                hasDependency = false
            }

            HAS_TIMBER = hasDependency
        }

        private val BUFFER_SIZE = 200

        private val LOG_FILE_END = ".log"

        @SuppressLint("StaticFieldLeak") private var sInstance: LumberYard? = null

        fun getInstance(context: Context): LumberYard {
            if (sInstance == null) {
                sInstance = LumberYard(context)
            }

            return sInstance!!
        }
    }
}