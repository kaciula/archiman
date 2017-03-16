package com.kaciula.archiman.presentation.util;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import com.kaciula.archiman.infrastructure.BaseApplication;

public class Toasts {

  private static final Handler MAIN_THREAD = new Handler(Looper.getMainLooper());

  public static void show(final String message) {
    final Context ctx = BaseApplication.getContext();
    if (Looper.myLooper() == Looper.getMainLooper()) {
      Toast.makeText(ctx, message, Toast.LENGTH_SHORT).show();
    } else {
      MAIN_THREAD.post(() -> Toast.makeText(ctx, message, Toast.LENGTH_SHORT).show());
    }
  }

  public static void show(final int messageId, final Object... args) {
    final Context ctx = BaseApplication.getContext();
    if (Looper.myLooper() == Looper.getMainLooper()) {
      Toast.makeText(ctx, ctx.getString(messageId, args), Toast.LENGTH_SHORT).show();
    } else {
      MAIN_THREAD.post(
          () -> Toast.makeText(ctx, ctx.getString(messageId, args), Toast.LENGTH_SHORT).show());
    }
  }

  public static void showLong(final String message) {
    final Context ctx = BaseApplication.getContext();
    if (Looper.myLooper() == Looper.getMainLooper()) {
      Toast.makeText(ctx, message, Toast.LENGTH_LONG).show();
    } else {
      MAIN_THREAD.post(() -> Toast.makeText(ctx, message, Toast.LENGTH_LONG).show());
    }
  }

  public static void showLong(final int messageId, final Object... args) {
    final Context ctx = BaseApplication.getContext();
    if (Looper.myLooper() == Looper.getMainLooper()) {
      Toast.makeText(ctx, ctx.getString(messageId, args), Toast.LENGTH_LONG).show();
    } else {
      MAIN_THREAD.post(
          () -> Toast.makeText(ctx, ctx.getString(messageId, args), Toast.LENGTH_LONG).show());
    }
  }
}
