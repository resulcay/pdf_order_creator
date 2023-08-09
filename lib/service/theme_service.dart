import 'package:flutter/material.dart';

class ThemeService {
  static ThemeData themeConfiguration(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
    );
  }
}
