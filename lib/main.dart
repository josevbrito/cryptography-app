import 'package:cryptocode/pages/welcome.dart';
import 'package:cryptocode/theme/dark_mode.dart';
import 'package:cryptocode/theme/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocode',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const Welcome(),
    );
  }
}
