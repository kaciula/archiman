package com.kaciula.archiman.infrastructure.log

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.TextView
import com.kaciula.archiman.R
import java.util.*

class LogAdapter : BaseAdapter() {
    private var logEntries: MutableList<LogEntry> = mutableListOf()

    override fun getCount(): Int {
        return logEntries.size
    }

    override fun getItem(position: Int): Any {
        return logEntries[position]
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {
        var convertView = convertView
        val viewHolder: ViewHolder

        if (convertView == null) {
            convertView = LayoutInflater
                    .from(parent.context).inflate(R.layout.dd_item_log_entry, parent, false)
            viewHolder = ViewHolder(convertView)

            convertView!!.tag = viewHolder
        } else {
            viewHolder = convertView.tag as ViewHolder
        }

        val logEntry = logEntries[position]
        viewHolder.fillData(logEntry)

        return convertView
    }

    fun setLogs(logs: List<LogEntry>) {
        logEntries = ArrayList(logs)
    }

    fun addLog(logEntry: LogEntry) {
        logEntries.add(logEntry)

        notifyDataSetChanged()
    }

    class ViewHolder(var rootView: View) {
        var logLevelTextView: TextView
        var logTagTextView: TextView
        var logMessageTextView: TextView

        init {
            logLevelTextView = rootView.findViewById(R.id.dd_text_log_level) as TextView
            logTagTextView = rootView.findViewById(R.id.dd_text_log_tag) as TextView
            logMessageTextView = rootView.findViewById(R.id.dd_text_log_message) as TextView
        }

        fun fillData(entry: LogEntry) {
            rootView.setBackgroundResource(backgroundForLevel(entry.level))
            logLevelTextView.text = entry.displayLevel()
            logTagTextView.text = String.format("%s %s", entry.timeStamp, entry.tag)
            logMessageTextView.text = entry.message
        }
    }

    companion object {

        fun backgroundForLevel(level: Int): Int {
            when (level) {
                Log.VERBOSE, Log.DEBUG -> return R.color.dd_debug_log_accent_debug
                Log.INFO -> return R.color.dd_debug_log_accent_info
                Log.WARN -> return R.color.dd_debug_log_accent_warn
                Log.ERROR, Log.ASSERT -> return R.color.dd_debug_log_accent_error
                else -> return R.color.dd_debug_log_accent_unknown
            }
        }
    }
}
