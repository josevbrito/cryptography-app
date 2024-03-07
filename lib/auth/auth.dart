import 'package:flutter/material.dart';
import 'package:library_app/auth/cadastro.dart';
import 'package:library_app/auth/login.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  // Inicialmente mostrando a Login Page
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showCadastro: toggleScreens);

    } else {
      return Cadastro(showLoginPage: toggleScreens);
    }
  }
}