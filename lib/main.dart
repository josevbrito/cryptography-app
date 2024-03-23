import 'package:cryptocode/pages/welcome.dart';
import 'package:cryptocode/theme/theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
      const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocode',
      theme: theme,
      home: const Welcome(),
    );
  }
}
