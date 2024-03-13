import 'package:flutter/material.dart';
import 'package:cryptocode_app/layouts/appbar.dart';

class DescriptoPage extends StatefulWidget {
  const DescriptoPage({super.key});

  @override
  State<DescriptoPage> createState() => _DescriptoPageState();
}

class _DescriptoPageState extends State<DescriptoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Descriptografar'),
      body: Center(child: Text('Descriptografar')),
    );
  }
}