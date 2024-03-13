import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptocode_app/auth/auth.dart';
import 'package:cryptocode_app/layouts/navbar.dart';

class Checagem extends StatefulWidget {
  const Checagem({super.key});

  @override
  State<Checagem> createState() => _ChecagemState();
}

class _ChecagemState extends State<Checagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const NavBar();
          } else {
            return const Auth();
          }
        },
      ),
    );
  }
}