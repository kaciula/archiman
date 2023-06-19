extension StringNonNullableExt on String {
  bool equalsIgnoreCase(String value) {
    return toLowerCase() == value.toLowerCase();
  }

  bool containsIgnoreCase(String value) {
    return toLowerCase().contains(value.toLowerCase());
  }

  bool startsWithIgnoreCase(String value) {
    return toLowerCase().startsWith(value.toLowerCase());
  }

  bool startsAWordWithIgnoreCase(String value) {
    return toLowerCase().startsWith(value.toLowerCase()) ||
        containsIgnoreCase(' $value');
  }

  String capitalizeFirst() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${length > 1 ? substring(1).toLowerCase() : ''}';
    }
    return '';
  }
}

extension StringNullableExt on String? {
  bool get isNotBlank => this != null && this!.trim().isNotEmpty;

  bool get isBlank => !isNotBlank;
}
