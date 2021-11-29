import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.blue[900],
        padding: const EdgeInsets.all(10.0),
        textStyle: const TextStyle(fontSize: 18),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        primary: Colors.blue[900],
        padding: const EdgeInsets.all(10.0),
        textStyle: const TextStyle(fontSize: 18),
      ),
    ),
  );
}
