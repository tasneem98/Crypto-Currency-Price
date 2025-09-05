import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 5.0,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(
          color: Colors.deepPurple,
          size: 24,
          applyTextScaling: true,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 20),
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardThemeData(
        elevation: 5.0,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),

      textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
    );
  }
}
