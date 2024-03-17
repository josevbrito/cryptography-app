import 'package:cryptocode/components/text.dart';
import 'package:flutter/material.dart';
import 'package:cryptocode/layouts/appbar.dart';

class EcryptionPage extends StatefulWidget {
  const EcryptionPage({super.key});

  @override
  State<EcryptionPage> createState() => _EcryptionPageState();
}

class _EcryptionPageState extends State<EcryptionPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Ecryption'),
      body: Center(
        child: TextModel(content: 'Ecryption', sizeText: 14, peso: 'normal')
      ),
    );
  }
}