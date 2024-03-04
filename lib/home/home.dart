import 'package:library_app/auth/checagem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_app/layouts/customAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Controllers
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Home Page', textAlign: TextAlign.center),
          TextButton(
            onPressed: () {
              sair();
            },
            child: const Text('Sair'))
        ],
      ),
    );
  }

  sair() async {
    await _firebaseAuth.signOut().then(
      (user) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Checagem(),))
    );
  }
}