import 'package:cryptocode/layouts/appbar.dart';
import 'package:flutter/material.dart';

class DecryptionPage extends StatefulWidget {
  const DecryptionPage({super.key});

  @override
  State<DecryptionPage> createState() => _DecryptionPageState();
}

class _DecryptionPageState extends State<DecryptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Encryption'),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: ListView(
                children: [
                  // Binary
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('Binary'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // route
                    },
                  ),

                  // Octal
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('Octal'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // route
                    },
                  ),

                  // Hexadecimal
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('Hexadecimal'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // route
                    },
                  ),

                  // Morse code
                  ListTile(
                    leading: const Icon(Icons.keyboard),
                    title: const Text('Morse Code'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      // route
                    },
                  ),


                ],
              ),
            ),
          ),
  
    );
  }
}