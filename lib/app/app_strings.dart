import 'package:auto_localized/annotations.dart';

@AutoLocalized(
  locales: <AutoLocalizedLocale>[
    AutoLocalizedLocale(
      languageCode: 'en',
      translationsFiles: [
        'resources/lang/en.yaml',
        'resources/lang/en_generic.yaml',
      ],
    ),
  ],
)
class $Strings {}
