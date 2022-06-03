extension StringNullableExt on String? {
  bool get isNotNullOrBlank =>
      this != null && (this?.trim().isNotEmpty ?? false);
}

extension StringExt on String {
  /// Capitalizes the string in normal form.
  String withFirstLetterCapitalized() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;

  /// Returns the word count in the given string.
  ///
  /// The pattern is based on spaces.
  /// ### Example
  /// ```dart
  /// String foo = 'Hello dear friend how you doing ?';
  /// int count = foo.countWords() // returns 7 words.
  /// ```
  int countWords() {
    if (isEmpty) {
      return 0;
    }
    final List<String> words = trim().split(RegExp(r'(\s+)'));
    return words.length;
  }

  /// Returns the word title cased.
  ///
  /// ```dart
  /// String foo = 'Hello dear friend how you doing ?';
  /// Sting titleCased = foo.toTitleCase() // returns 'Hello Dear Friend How You Doing'.
  /// ```
  String toTitleCase() {
    if (isEmpty) {
      return this;
    }
    final List<String> words = toLowerCase().split(' ');
    for (int i = 0; i < words.length; i++) {
      words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1);
    }

    return words.join(' ');
  }

  /// Removes only the numbers from the String.
  /// ### Example 1
  /// ```dart
  /// String foo = 'es4e5523nt1is';
  /// String noNumbers = foo.removeNumbers() // returns 'esentis'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '1244e*s*4e*5523n*t*1i*s'
  /// String noNumbers = foo.removeNumbers() // returns 'e*s*e*n*t*i*s'
  /// ```
  String removeNumbers() {
    if (isEmpty) {
      return this;
    }
    final RegExp regex = RegExp(r'(\d+)');
    return replaceAll(regex, '');
  }

  /// Returns only the letters from the String.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/es4e5523nt1is';
  /// String onlyLetters = foo.onlyLetters() // returns 'esentis'
  /// ```
  String onlyLetters() {
    if (isEmpty) {
      return this;
    }
    // ignore: unnecessary_raw_strings
    final RegExp regex = RegExp(r'([^a-zA-Z]+)');
    return replaceAll(regex, '');
  }

  /// Returns whether the String is valid IPv4.
  /// ### Example 1
  /// ```dart
  /// String foo = '192.168.1.14';
  /// bool isIpv4 = foo.isIpv4(); // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '192.168.1.14.150.1225';
  /// bool isIpv4 = foo.isIpv4(); // returns false
  /// ```
  bool isIpv4() {
    if (isEmpty) {
      return false;
    }
    final RegExp regex = RegExp(
        r'((?:^|\s)([a-z]{3,6}(?=://))?(://)?((?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?))(?::(\d{2,5}))?(?:\s|$))');
    return regex.hasMatch(this);
  }

  /// Returns whether the String is valid IPv6.
  /// ### Example 1
  /// ```dart
  /// String foo = '2001:0db8:85a3:0000:0000:8a2e:0370:7334';
  /// bool isIpv6 = foo.isIpv6(); // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '192.168.1.14.150.1225';
  /// bool isIpv6 = foo.isIpv6(); // returns false
  /// ```
  bool isIpv6() {
    if (isEmpty) {
      return false;
    }

    final RegExp regex = RegExp(
        r'(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))');
    return regex.hasMatch(this);
  }

  /// Returns whether the String is mail or not.
  /// ### Example
  /// ```dart
  /// String foo = 'esentis@esentis.com'
  /// bool isMail = foo.isMail() // returns true
  /// ```
  bool isEmail() {
    if (isEmpty) {
      return false;
    }
    final RegExp regex =
        RegExp(r"(^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)");
    return regex.hasMatch(this);
  }

  /// Returns whether the String is a number.
  /// ### Example
  /// ```dart
  /// String foo = '45';
  /// bool isNumber = foo.isNumber(); // returns true
  /// ```
  /// ```dart
  /// String foo = '45s';
  /// String isNumber = foo.isNumber() // returns false
  bool isNumber() {
    if (isEmpty) {
      return false;
    }
    final RegExp regex = RegExp(r'^\d+$');
    return regex.hasMatch(this);
  }

  /// Returns whether the String is a "strong" password which complies to below rules :
  ///  * At least 1 uppercase
  ///  * At least 1 special character
  ///  * At least 1 number
  ///  * At least 8 characters in length
  /// ### Example
  /// ```dart
  /// String foo = 'qwerty'
  /// bool isStrong = foo.isStrongPassword() // returns false
  /// ```
  /// ```dart
  /// String foo = 'IsTh!$Strong'
  /// bool isStrong = foo.isStrongPassword() // returns true
  /// ```
  bool isStrongPassword() {
    if (isEmpty) {
      return false;
    }
    final RegExp regex = RegExp(
        r'^(?=.*([A-Z]){1,})(?=.*[!@#$&*]{1,})(?=.*[0-9]{1,})(?=.*[a-z]{1,}).{8,100}$');
    return regex.hasMatch(this);
  }

  /// Returns the String reversed.
  /// ### Example
  /// ```dart
  /// String foo = 'Hello World';
  /// String reversed = foo.reverse() ; // returns 'dlrow olleH'
  /// ```
  String reverse() {
    if (isEmpty) {
      return this;
    }
    final Iterable<String> letters = split('').toList().reversed;
    return letters.reduce((String current, String next) => current + next);
  }

  /// Returns the first [n] characters of the string.
  ///
  /// n is optional, by default it returns the first character of the string.
  ///
  /// If [n] provided is longer than the string's length, the string will be returned.
  ///
  /// Faster than using
  /// ```dart
  /// substring(0,count)
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'hello world';
  /// String firstChars = foo.first(); // returns 'h'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'hello world';
  /// bool firstChars = foo.first(3); // returns 'hel'
  /// ```
  String first({int n = 1}) {
    if (isEmpty) {
      return this;
    }
    if (length < n) {
      return this;
    }
    return substring(0, n);
  }

  /// Returns the last [n] characters of the string.
  ///
  /// [n] is optional, by default it returns the first character of the string.
  ///
  /// If [n] provided is longer than the string's length, the string will be returned.
  ///
  /// Faster than using
  /// ```dart
  /// substring(length-n,length)
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'hello world';
  /// String firstChars = foo.last(); // returns 'd'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'hello world';
  /// bool firstChars = foo.last(3); // returns 'rld'
  /// ```
  String last({int n = 1}) {
    if (isEmpty) {
      return this;
    }
    if (length < n) {
      return this;
    }
    return substring(length - n, length);
  }

  /// Given a pattern returns the starting indices of all occurences of the pattern in the string.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'abracadabra';
  /// String fooOccs = foo.findPatterns(pattern:'abr'); // returns '[0, 7]'
  /// ```
  List<int> findPattern({required String pattern}) {
    if (isEmpty) {
      return <int>[];
    }
    // ignore: omit_local_variable_types
    final List<int> occurences = <int>[];
    // How many times the pattern can fit the text provided
    final int fitCount = (length / pattern.length).truncate().toInt();
    if (fitCount > length) {
      return <int>[];
    }
    if (fitCount == 1) {
      if (this == pattern) {
        return <int>[0];
      }
      return <int>[];
    }
    for (int i = 0; i <= length; i++) {
      if (i + pattern.length > length) {
        return occurences;
      }
      if (substring(i, i + pattern.length) == pattern) {
        occurences.add(i);
      }
    }
    return occurences;
  }
}
