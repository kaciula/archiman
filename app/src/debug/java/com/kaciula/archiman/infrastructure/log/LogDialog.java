package com.kaciula.archiman.infrastructure.log;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.content.FileProvider;
import android.support.v7.app.AlertDialog;
import android.widget.ListView;
import android.widget.Toast;
import com.kaciula.archiman.BuildConfig;
import com.kaciula.archiman.presentation.util.Intents;
import java.io.File;

public class LogDialog extends AlertDialog {

  private final LogAdapter adapter;

  private final Handler handler = new Handler(Looper.getMainLooper());

  public LogDialog(Context context) {
    super(context);

    adapter = new LogAdapter();

    ListView listView = new ListView(context);
    listView.setTranscriptMode(ListView.TRANSCRIPT_MODE_NORMAL);
    listView.setAdapter(adapter);

    setTitle("Logs");
    setView(listView);
    setButton(BUTTON_NEGATIVE, "Close", (dialog, which) -> {
              /* no-op */
    });
    setButton(BUTTON_POSITIVE, "Share", (dialog, which) -> share());
  }

  @Override
  protected void onStart() {
    super.onStart();

    LumberYard lumberYard = LumberYard.getInstance(getContext());

    adapter.setLogs(lumberYard.bufferedLogs());

    lumberYard.setOnLogListener(logEntry -> addLogEntry(logEntry));
  }

  private void addLogEntry(final LogEntry logEntry) {
    handler.post(() -> adapter.addLog(logEntry));
  }

  @Override
  protected void onStop() {
    super.onStop();

    LumberYard.getInstance(getContext()).setOnLogListener(null);
  }

  private void share() {
    LumberYard.getInstance(getContext())
        .save(new LumberYard.OnSaveLogListener() {
          @Override
          public void onSave(File file) {
            Intent sendIntent = new Intent(Intent.ACTION_SEND);
            sendIntent.setType("text/plain");
            sendIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            sendIntent.putExtra(Intent.EXTRA_STREAM, FileProvider.getUriForFile(getContext(),
                BuildConfig.FILE_PROVIDER_AUTHORITY, file));
            Intents.INSTANCE.maybeStartActivity(getContext(), sendIntent);
          }

          @Override
          public void onError(String message) {
            Toast.makeText(getContext(), message, Toast.LENGTH_LONG).show();
          }
        });
  }
}