import 'package:flutter/material.dart';

ThemeData buildSolgasTheme() {
  const primary = Color(0xFF1976D2); // Azul corporativo
  const secondary = Color(0xFFFF9800); // Naranja

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: 'Inter', fontSize: 14),
      titleLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 20),
      labelLarge: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    ),
  );
}
