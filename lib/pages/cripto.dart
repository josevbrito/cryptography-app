import 'package:flutter/material.dart';
import 'package:cryptocode/layouts/appbar.dart';

class CriptoPage extends StatefulWidget {
  const CriptoPage({super.key});

  @override
  State<CriptoPage> createState() => _CriptoPageState();
}

class _CriptoPageState extends State<CriptoPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Criptografar'),
      body: Center(
        child: Text(
          'Criptografar'
        ),
      ),
    );
  }
}