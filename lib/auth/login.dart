import 'package:library_app/auth/cadastro.dart';
import 'package:library_app/auth/checagem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  // Página
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page')
      ),

      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              label: Text('e-mail'),
            ),

          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              label: Text('password'),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              login();
            },
            child: Text('Entrar'),
          ),

          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CadastroPage()
              )
            );
          }, child: Text('Criar Conta'))
        ],
      ),
    );
  }

  login() async {
    try {

      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text
      );

      if (userCredential != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Checagem(),
          )
        );
      }

    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuário não encontrado'),
            backgroundColor: Colors.redAccent,
          )
        );
      } else if(e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Senha Incorreta'),
            backgroundColor: Colors.redAccent,
          
          )
        );
      }
    }
  }
}