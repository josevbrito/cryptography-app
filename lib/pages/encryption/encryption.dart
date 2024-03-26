import 'package:cryptocode/layouts/appbar.dart';
import 'package:cryptocode/pages/encryption/binary_e.dart';
import 'package:cryptocode/pages/encryption/octal_e.dart';
import 'package:flutter/material.dart';

class EncryptionPage extends StatefulWidget {
  const EncryptionPage({super.key});

  @override
  State<EncryptionPage> createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BinaryE()));
                    },
                  ),

                  // Octal
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('Octal'),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OctalE()));
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