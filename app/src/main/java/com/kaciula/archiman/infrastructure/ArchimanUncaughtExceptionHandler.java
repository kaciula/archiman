package com.kaciula.archiman.infrastructure;

import android.content.Context;
import android.content.Intent;
import com.kaciula.archiman.presentation.screen.main.MainActivity;

public class ArchimanUncaughtExceptionHandler implements Thread.UncaughtExceptionHandler {

  private Context context;

  public ArchimanUncaughtExceptionHandler(Context context) {
    this.context = context;
  }

  @Override
  public void uncaughtException(Thread thread, Throwable ex) {
    Intent startIntent = MainActivity.getStartIntent(context);
    startIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
    context.startActivity(startIntent);

    android.os.Process.killProcess(android.os.Process.myPid());
    System.exit(10);
  }
}
