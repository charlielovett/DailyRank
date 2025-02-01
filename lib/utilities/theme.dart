import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get customTheme {
    const Color primaryColor = Color(0xFF7E71FC);
    const Color secondaryColor = Color(0xFF6D73FF);
    const Color tertiaryColor = Color(0xFFEBEBFF);

    // Create a simple theme using these colors
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
      ),
      useMaterial3: true,
    );
  }
}
