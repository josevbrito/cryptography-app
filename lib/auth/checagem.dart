
import 'dart:async';
import 'package:library_app/home/home.dart';
import 'package:flutter/material.dart'; 
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Autenticação
import 'package:library_app/auth/login.dart';

class Checagem extends StatefulWidget {
  const Checagem({super.key});

  @override
  State<Checagem> createState() => _ChecagemState();
}

class _ChecagemState extends State<Checagem> {

  StreamSubscription? streamSubscription;

  // Logo que iniciar fará essa lógica
  @override
  void initState() {
  streamSubscription = FirebaseAuth.instance.authStateChanges().listen((User? user) {
    // Lógica para verificar se está logado
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        )
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        )
      );
    }
    });
    super.initState();
  }

  @override
  void dispose(){
    streamSubscription!.cancel();
    super.dispose();
  }

  // Carregando
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      )
    );
  }
}