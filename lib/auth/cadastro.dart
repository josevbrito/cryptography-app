import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  final VoidCallback showLoginPage;
  const Cadastro({Key? key, required this.showLoginPage}) : super(key:key);


  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  // Autenticação
  Future cadastrar() async {
    //Criar usuário
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    // Adicionando detalhes
    addUserDetails(
      _firstNameController.text.trim(),
      _lastNameController.text.trim(),
      _emailController.text.trim(),
      int.parse(_ageController.text.trim()),
      
    );


    }
  }

  Future addUserDetails(String firstName, String lastName, String email, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,

    });
  }

  bool passwordConfirmed() {
    if(_passwordController.text.trim() == _confirmPasswordController.text.trim()){
      return true;
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Icon(
                Icons.android,
                size: 100
              ),
            
              const SizedBox(height: 70),
            
              // Hello
              const Text(
                'Biblioteca Virtual!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.deepPurple
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                'Cadastre-se, agora!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 50),

              // First Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Nome',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
            
              const SizedBox(height: 10,),

              // Last Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Sobrenome',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
            
              const SizedBox(height: 10,),

              // Age
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Idade',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
            
              const SizedBox(height: 10,),
                    
              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Email',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
            
              const SizedBox(height: 10,),
            
              // Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Senha',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              // Confirm Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  obscureText: true,
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Confirme a Senha',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            
            
              // Botão
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: cadastrar,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Cadastrar',
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
                    'Já tem cadastro? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text(
                      'Faça Login!',
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