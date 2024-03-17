import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
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

  
  // Themes
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!
  ),
);