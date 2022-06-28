import 'package:flutter/material.dart';

class CustomTheme {
  static bool isDark=false;

  // CustomTheme([this.isDark = false]);
  static const Color _lightPrimaryColor = Color(0xFF1A4D2E);
  static const Color _lightPrimaryVariantColor = Color(0xFFFF9F29);
  static const Color _lightSecondaryColor = Color(0xFFFAF3E3);

  static const Color _darkPrimaryColor = Color(0xFF1A4D2E);
  static const Color _darkPrimaryVariantColor = Color(0xFF1A4D2E);
  static const Color _darkSecondaryColor = Color(0xFFFAF3E3);


  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      primaryColorLight: _lightPrimaryColor,
      scaffoldBackgroundColor: _lightSecondaryColor,
      textTheme: const TextTheme(
        displayMedium: TextStyle(fontStyle: FontStyle.italic),
        displayLarge: TextStyle(fontWeight: FontWeight.bold,fontSize: 60,color: _lightPrimaryColor),
      ),
      inputDecorationTheme: const InputDecorationTheme(fillColor: _lightPrimaryVariantColor )
    );
  }
  static ThemeData darkTheme() {
    return ThemeData.light().copyWith(
    );
  }

}
