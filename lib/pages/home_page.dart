import 'package:cryptocode/pages/settings.dart';
import 'package:cryptocode/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedOption = 'Binary';
  String _convertedText = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // App Bar
      appBar: AppBar(
        // Color
        backgroundColor: theme.canvasColor,

        // Text
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        // Center Text
        centerTitle: true,
        elevation: 20,
        // Setting Button
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),

      // Página
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))
              ),
              child: Column(
                children: [
                // TextField
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25), child: Divider(thickness: 0.5, color: Colors.grey[800])),
                // Text convert
                ]
              )
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    // Dropdown
                    // Ícone para mudar os valores
                    // Dropdown
                  ),
              
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(100.0, 100.0)), // Tamanho mínimo do botão
                      maximumSize: MaterialStateProperty.all(Size(200.0, 200.0)), // Tamanho máximo do botão
                    ),
                    onPressed: () {},
                    child: const Text('OK', style: TextStyle(fontSize: 20),),
                  )
              
              
                ],
              ),
            ),

            

        ],),
      ),
    );
  }
}
