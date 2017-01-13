package com.kaciula.archiman.util.log;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.kaciula.archiman.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class LogAdapter extends BaseAdapter {
  private List<LogEntry> logEntries = Collections.emptyList();

  @Override
  public int getCount() {
    return logEntries.size();
  }

  @Override
  public Object getItem(int position) {
    return logEntries.get(position);
  }

  @Override
  public long getItemId(int position) {
    return position;
  }

  @Override
  public View getView(int position, View convertView, ViewGroup parent) {
    ViewHolder viewHolder;

    if (convertView == null) {
      convertView = LayoutInflater
          .from(parent.getContext()).inflate(R.layout.dd_item_log_entry, parent, false);
      viewHolder = new ViewHolder(convertView);

      convertView.setTag(viewHolder);
    } else {
      viewHolder = (ViewHolder) convertView.getTag();
    }

    LogEntry logEntry = logEntries.get(position);
    viewHolder.fillData(logEntry);

    return convertView;
  }

  public void setLogs(List<LogEntry> logs) {
    logEntries = new ArrayList<>(logs);
  }

  public void addLog(LogEntry logEntry) {
    logEntries.add(logEntry);

    notifyDataSetChanged();
  }

  static class ViewHolder {

    View rootView;
    TextView logLevelTextView;
    TextView logTagTextView;
    TextView logMessageTextView;

    ViewHolder(View view) {
      rootView = view;
      logLevelTextView = (TextView) view.findViewById(R.id.dd_text_log_level);
      logTagTextView = (TextView) view.findViewById(R.id.dd_text_log_tag);
      logMessageTextView = (TextView) view.findViewById(R.id.dd_text_log_message);
    }

    void fillData(LogEntry entry) {
      rootView.setBackgroundResource(backgroundForLevel(entry.getLevel()));
      logLevelTextView.setText(entry.displayLevel());
      logTagTextView.setText(String.format("%s %s", entry.getTimeStamp(), entry.getTag()));
      logMessageTextView.setText(entry.getMessage());
    }
  }

  public static int backgroundForLevel(int level) {
    switch (level) {
      case Log.VERBOSE:
      case Log.DEBUG:
        return R.color.dd_debug_log_accent_debug;
      case Log.INFO:
        return R.color.dd_debug_log_accent_info;
      case Log.WARN:
        return R.color.dd_debug_log_accent_warn;
      case Log.ERROR:
      case Log.ASSERT:
        return R.color.dd_debug_log_accent_error;
      default:
        return R.color.dd_debug_log_accent_unknown;
    }
  }
}
