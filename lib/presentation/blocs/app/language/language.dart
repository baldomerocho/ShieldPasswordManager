import 'dart:ui';

import 'package:flutter/widgets.dart';

enum Language {
  english(
    Locale('en', 'US'),
    'assets/flags/usa.png',
    'English',
  ),
  spanish(
    Locale('es', 'ES'),
    'assets/flags/spain.png',
    'Español',
  );

  /// Add another languages support here
  const Language(this.value, this.icon, this.text);

  final Locale value;
  final String icon;
  final String text; // Optional: this properties used for ListTile details
}