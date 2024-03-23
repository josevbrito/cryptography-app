import 'package:flutter/material.dart';

// Light Mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Quicksand',
  useMaterial3: true,
  
  // App Bar Themes
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black,),
  ),

  // Text
  textTheme: const TextTheme(
    labelLarge: TextStyle(color: Colors.black),
  ),

  // Themes
  colorScheme: ColorScheme.light(
    background: Colors.grey[300]!,
    primary: Colors.grey[200]!,
    secondary: Colors.grey[300]!
  )
);

// Dark Mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Quicksand',
  useMaterial3: true,

  // App Bar Themes
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white,),
  ),

  // Text
  textTheme: const TextTheme(
    labelLarge: TextStyle(color: Colors.white),
  ),

  // Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          return Colors.white;
        },
      ),
    ),
  ),

  // Themes
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
  ),
);
