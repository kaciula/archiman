package com.kaciula.archiman.domain.util;

import io.reactivex.annotations.NonNull;
import java.text.Normalizer;

public final class Strings {
  private Strings() {
    // No instances.
  }

  public static boolean isBlank(CharSequence string) {
    return (string == null || string.toString().trim().length() == 0);
  }

  public static String valueOrDefault(String string, String defaultString) {
    return isBlank(string) ? defaultString : string;
  }

  public static boolean areEqual(String one, String two) {
    return one == null ? two == null : one.equals(two);
  }

  public static String withoutDiacriticals(@NonNull String string) {
    Preconditions.checkNotNull(string);
    return Normalizer.normalize(string, Normalizer.Form.NFD)
        .replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
  }
}
