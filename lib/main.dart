import 'package:cryptocode/pages/welcome.dart';
import 'package:cryptocode/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocode',
      theme: Provider.of<ThemeData>(context),
      home: const Welcome(),
    );
  }
}
