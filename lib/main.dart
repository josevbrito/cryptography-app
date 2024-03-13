import 'package:cryptocode_app/auth/checagem.dart';
import 'package:cryptocode_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'library',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        primaryColor: const Color.fromARGB(255, 56, 18, 195),
        primarySwatch: Colors.blue,
      ),
      home: const Checagem(),
    );
  }
}
