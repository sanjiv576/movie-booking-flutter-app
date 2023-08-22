import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme() {
    return ThemeData(
      // scaffoldBackgroundColor: AppColorConstant.scafoldColor,
      appBarTheme: const AppBarTheme(
        // backgroundColor: Colors.amber,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
      ),
      // textTheme: const TextTheme(
      //   labelSmall: TextStyle(color: Colors.red, fontSize: 33, fontWeight: FontWeight.bold),
      // ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        // showUnselectedLabels: true,
        // type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
