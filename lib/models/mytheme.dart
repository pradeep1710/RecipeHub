import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.orange,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.orange,
        accentColor: Colors.black12,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white, foregroundColor: Colors.orange),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange.shade600,
      ),
      appBarTheme: AppBarTheme(backgroundColor: Colors.orange.shade400));

  static ThemeData darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.orange,
        accentColor: Colors.white,
        brightness: Brightness.dark,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.orange, foregroundColor: Colors.black),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
      ),
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900));
}
