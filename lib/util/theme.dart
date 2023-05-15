import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 13,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color.fromRGBO(0, 210, 223, 1),
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 11,
        color: Color.fromRGBO(0, 210, 223, 1),
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(0, 210, 223, 1),
      onPrimary: Color.fromRGBO(0, 210, 223, 0.2),
      secondary: Color.fromRGBO(251, 188, 5, 1),
      onSecondary: Color.fromRGBO(251, 188, 5, 0.2),
      error: Color.fromRGBO(253, 58, 106, 1),
      onError: Color.fromRGBO(253, 58, 106, 1),
      background: Colors.black,
      onBackground: Color.fromRGBO(52, 52, 52, 1),
      surface: Color.fromRGBO(255, 255, 255, 0.1),
      onSurface: Color.fromRGBO(255, 255, 255, 0.2),
    ),
    hintColor: const Color.fromRGBO(255, 255, 255, 0.5),
  );
}
