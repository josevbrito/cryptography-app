import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cryptocode_app/layouts/appbar.dart';

class CriptoPage extends StatefulWidget {
  const CriptoPage({super.key});

  @override
  State<CriptoPage> createState() => _CriptoPageState();
}

class _CriptoPageState extends State<CriptoPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Home Page'),
      body: Center(
        child: Text(
          'Home Page'
        ),
      ),
    );
  }
}