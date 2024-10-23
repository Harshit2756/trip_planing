import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF18C0C1);
  static const Color secondaryColor = Color(0xFF546A83);
  static const Color accentColor = Color(0xFFC8D3E4);
  static const Color iconColor = Color(0xFF625B71);
  static const Color buttonBgColor = Color(0xFFA2B3CC);

  // Light theme

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFFF1F4F9),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.0,
        color: Colors.black54,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.0,
        color: Colors.black87,
      ),
      labelLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          )),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: primaryColor),
      ),
      labelStyle: const TextStyle(color: Colors.grey),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
  );
}
