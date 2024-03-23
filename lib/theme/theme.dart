import 'package:flutter/material.dart';

// Dark Mode
ThemeData theme = ThemeData(
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
