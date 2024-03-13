import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptocode_app/auth/esqueci_senha.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showCadastro;
  const LoginPage({Key? key, required this.showCadastro}) : super(key:key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Login
  Future login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim()
    );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  // Visualizar a senha
  bool _isObscure = true;

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Página
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
              // Hello
              const Text(
                'Biblioteca Virtual',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.deepPurple
                ),
              ),
              const SizedBox(height: 7,),
              const Text(
                'Seja bem vindo de volta, sentimos sua falta!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 50),
                    
              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            
              const SizedBox(height: 10,),
            
              // Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  obscureText: _isObscure,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Senha',
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const EsqueciSenha();
                          }
                          )
                        );
                      },
                      child: const Text(
                        'Esqueci minha senha.',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )
                            
                      ),
                    )
                    
                  ],
                ),
              ),

              const SizedBox(height: 10,),
            
            
              // Botão
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: login,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            
              const SizedBox(height: 25),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem cadastro? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            
                  GestureDetector(
                    onTap: widget.showCadastro,
                    child: const Text(
                      'Cadastre-se agora!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  )
                ],
              ),
            ],
            ),
          ),
        ),
      ),
    );
  
  }
}